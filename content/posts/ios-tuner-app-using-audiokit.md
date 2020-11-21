---
title: "iOS Tuner App Using Audiokit"
date: 2018-08-29T12:23:50+08:00
thumbnail: ""
static_page: false
draft: false
---
I made an iOS [Tuner & Metronome App](/tuner-music-training) last couple of months due to boredom. Suffering from boredom again this month, I decided to write an article on how I implement it.

<br />

In this article, I will show:

1. How to sample audio from the microphone using [AudioKit](https://audiokit.io/).
2. How to calculate the notes from raw frequencies (of the sampled audio).

<br />

I will not delve into how I implement the views since the code is quite bulky and tedious. Similarly, I will not write anything about how I made the metronome, since the mechanics behind it are just some trivial algebraic manipulations.

<br />

We divide our tasks into three classes: `Note`, `Pitch`, and `Tuner`. The `Note` class represents a single (natural) musical note. For example, *C (Do)*, *D (Re)*, *E (Mi)*, *C♯*, *E♭*. The `Pitch` class is used to process the sampled audio, taking its raw frequency and assign it to the nearest natural note. The `Tuner` class polls the audio through microphone, acquires the natural note through the `Pitch` class, and calculates the error ratio between the raw frequency and the "correct" natural pitch.

<br />

This article will be written in a bottom to top approach, from the `Note` class, the `Pitch` class, to the `Tuner` class.

# The Note Class
Before coding, we need to understand some basic principles of music theory. First of all, we divide music notes into octaves, each octave consists of 12 notes, and the interval of two adjacent notes is a semitone. They could be visualized easily on a piano keyboard.

![Octave and Semitone](/posts/ios-tuner-app-using-audiokit/octave-and-semitone.png)

By this knowledge, we can write our `Note` class:

{{< highlight swift "linenos=table" >}}
class Note: Equatable {
    enum Accidental: Int { case natural = 0, sharp, flat }
    enum Name: Int { case a = 0, b, c, d, e, f, g }
    
    // All the 12 notes in an octave.
    static let all: [Note] = [
        Note(.c, .natural), Note(.c, .sharp),
        Note(.d, .natural),
        Note(.e, .flat), Note(.e, .natural),
        Note(.f, .natural), Note(.f, .sharp),
        Note(.g, .natural),
        Note(.a, .flat), Note(.a, .natural),
        Note(.b, .flat), Note(.b, .natural)
    ]
    
    var note: Name
    var accidental: Accidental
    
    // Initializer.
    init(_ note: Name, _ accidental: Accidental) {
        self.note = note
        self.accidental = accidental
    }

    // Equality operators.
    static func ==(lhs: Note, rhs: Note) -> Bool {
        return lhs.note == rhs.note && lhs.accidental == rhs.accidental
    }
    
    static func !=(lhs: Note, rhs: Note) -> Bool {
        return !(lhs == rhs)
    }
}
{{< / highlight >}}

We combine all the possible `Note Name` & `Accidental` pairs (12 notes in total), pass them through `init(_:_:)` to initialize a `Note` typed object, and store them in the `all` array for convenience.

<br />

The `Equatable` protocol is adopted, and the `==`, `!=` operators are implemented because we will later use the `Array.index(of:)` function to locate the current note in the `all` array. (Note that `Array.index(of:)` takes an equatable type as its parameter, and returns the index of the object equivalent to the passed-in object if it exists.)

<br />

To complete the last part of the `Note` class, we have to get back to music theory again. In modern times, we set the middle A (aka A4) as our standard of tuning. The middle A is defined as 440Hz, where the next higher A is two times of 440Hz, that is, 880Hz. Similarly, the next lower A is the half of 440Hz, namely, 220Hz.

<br />

Furthermore, since there are 12 notes between the higher and lower As, we cut the intervals so that each of the adjacent ones have the same ratio. This is called the [Equal Temperament](https://en.wikipedia.org/wiki/Equal_temperament). (Throughout the history, a variety of temperaments have been used, see [Musical Temperament](https://en.wikipedia.org/wiki/Musical_temperament). However, most of the digital tuners implement only the equal temperament.) Below is a diagram showing the concept.

![Equal Temperament](/posts/ios-tuner-app-using-audiokit/equal-temperament.png)

(Note that the intervals are not equally sized as portrayed. [i.e. 440 - 220 ≠ 880 - 440]. The interval between A4 & A5 is actually twice the size of the interval between A3 & A4.)

<br />

As a result, we can easily obtain the next `i`-th semitone of middle A by multiplying 440Hz by `pow(2, i / 12)`. Hence, we can now add a getter in `Note` class to get the exact frequency of the current note.

{{< highlight swift "linenos=table" >}}
class Note: Equatable {
    // ...code omitted...

    var frequency: Double {
         let index = Note.all.index(of: self)! - Note.all.index(of: Note(.a, .natural))!
         return 440.0 * pow(2.0, Double(index) / 12.0)
    }
}
{{< / highlight>}}

Now we can obtain the exact frequency of every note in the middle octave. Also, as stated before, by multiplying each note by 2, we can simply get the next octave. (By dividing each note by 2, we get the previous octave.)

# The Pitch Class
Moving on to the `Pitch` class. In this class, our aim is to receive a raw frequency, and locate it to the nearest note.

<br />

We declare some variables, implement the initializer, and construct an array storing all the notes from 0th octave to 8th octave.

{{< highlight swift "linenos=table" >}}
class Pitch {
    let frequency: Double
    let note: Note
    let octave: Int

    private init(note: Note, octave: Int) {
        self.note = note
        self.octave = octave
        self.frequency = note.frequency * pow(2.0, Double(octave) - 4.0)
    }

    // All the notes from 0th octave to 8th octave.
    static let all = Array((0...8).map { octave -> [Pitch] in
        Note.all.map { note -> Pitch in
            Pitch(note: note, octave: octave)
        }
    }).joined()
}
{{< / highlight >}}

The `frequency` variable stores the raw frequency we received, `note` stores the nearest note to the raw `frequency`. Since the `Note` class contains the middle octave (aka the 4th octave) only, we have to declare another variable to store the `octave` of the current pitch.

<br />

In the initializer, we multiply the frequency (of the note of the middle octave) by `pow(2, octave - 4)` to obtain the actual frequency of the note in the target `octave`. (This is so because the middle octave is usually defined as the 4th octave. [For example, A in the 6th octave is obtained by 440 * 2 * 2 = `440 * pow(2, 6 - 4)`.])

<br />

The `all` array may seem complicated since it is constructed by two closures. What I did is generating a nested array, and flattening them. In the outer closure, we loop from the 0th octave to the 8th octave (that is, `0...8`), and generate an array of `Pitch`es for each octave. The arrays (`[Pitch]`) are then filled by the inner closure. It uses `Array.map` to generate all 12 `Pitch`es in an octave from the `Note.all` array. Lastly, `.joined()` flattens the array, making the originally nested array to a linear one. The following form shows the whole nested array before `joined()`.

![Notes From 0th Octave to 8th](/posts/ios-tuner-app-using-audiokit/pitch-all-form.png)

Now comes the most important function of `Pitch`. We take a raw frequency, and instance a `Pitch` object of the nearest note.

{{< highlight swift "linenos=table" >}}
class Pitch {
    // ...code omitted...

    static func makePitchByFrequency(_ frequency: Double) -> Pitch {
        var results = all.map { pitch -> (pitch: Pitch, distance: Double) in
            (pitch: pitch, distance: abs(pitch.frequency - frequency))
        }
        
        results.sort { $0.distance < $1.distance }
        
        return results.first!.pitch
    }
}
{{< / highlight >}}

What we do is looping through the `all` array by `.map`, and produce an array of tuples called `results`. It stores the original `Pitch` object as well as the distance (i.e. difference) between the raw frequency and and frequency of the particular `pitch`. The `results` array is then sorted in ascending order by their `distance`. We take the first item in the array (that is, the item with the least `distance`), and `return` the pitch. The nearest note is then obtained.

# The Tuner Class
The `Tuner` class is implemented by utilizing the `Pitch` class and the AudioKit library. You should first import AudioKit to your Xcode workspace. [[Link](https://audiokit.io/downloads/)]

After importing AudioKit, initialize it and declare some related variables.

{{< highlight swift "linenos=table" >}}
import AudioKit

class Tuner {
    let mic: AKMicrophone
    let tracker: AKFrequencyTracker
    let silence: AKBooster

    init() {
        do {
            // Configure settings of AVFoundation.
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryRecord, mode: AVAudioSessionModeMeasurement, options: [])
        } catch let error {
            print(error.localizedDescription)
        }
        
        AKSettings.audioInputEnabled = true
        mic = AKMicrophone()
        tracker = AKFrequencyTracker.init(mic)
        silence = AKBooster(tracker, gain: 0)
        
        AudioKit.output = silence
    }
}

{{< / highlight >}}

In the initializer, we first configure the setting of Apple's AVFoundation through the `AVAudioSession` singleton. We specify the category to `AVAudioSessionCategoryRecord` because we want to sample the audio by recording through the microphone. The mode is set to `AVAudioSessionModeMeasurement` since the purpose of the app is to measure the audio.

<br />

Next on, we initialize the microphone for AudioKit. We first enable audio input, then initialize `mic`, `tracker`, and `silence` as `AKMicrophone`, `AKFrequencyTracker` and `AKBooster`. `AKMicrophone` is just the microphone class for AudioKit, `AKFrequencyTracker` is a well-implemented frequency tracker which analyzes sound waves to obtain the frequency of the input audio. `AKBooster` is a stereo mixer, we initialize it by our frequency tracker and set it as the output of AudioKit.

<br />

After the initialization, we implement two simple functions: `start()` and `stop()`, which starts off audio polling of the tuner and terminates it respectively.

{{< highlight swift "linenos=table" >}}
class Tuner {
    let pollingInterval = 0.05
    
    var pollingTimer: Timer?

    // ...code omitted...

    func start() {
        do {
            try AudioKit.start()
        } catch let error {
            print(error.localizedDescription)
        }
        
        pollingTimer = Timer.scheduledTimer(withTimeInterval: pollingInterval, repeats: true, block: {_ in self.pollingTick()})
    }
    
    func stop() {
        do {
            try AudioKit.stop()
        } catch let error {
            print(error.localizedDescription)
        }
        
        if let t = pollingTimer {
            t.invalidate()
        }
    }
}
{{< / highlight >}}

In the start function, we call `AudioKit.start()` to turn on the polling through microphone which we initialized earlier. We then schedule the `pollingTimer` to repeatedly tick every `0.05` second. The `pollingTick()` function will be called every tick, which we will implement later. The `stop()` function is more straightforward, we call `AudioKit.stop()` to stop polling audio, and `.invalidate()` to cancel the `pollingTimer`.

<br />

Moving on to the `pollingTick()` function:

{{< highlight swift "linenos=table" >}}
class Tuner {
    var delegate: TunerDelegate?

    // ...code omitted...

    private func pollingTick() {
        let frequency = Double(tracker.frequency)
        let pitch = Pitch.makePitchByFrequency(frequency)
        let errRatio = frequency / pitch.frequency
        
        if let d = delegate {
            d.tunerDidTick(pitch: pitch, errRatio: errRatio)
        }
    }
}
{{< / highlight >}}

We get the current raw frequency of the audio simply by calling `tracker.frequency`, then pass it in to `Pitch.makePitchByFrequency()` to get the pitch of the nearest note. By doing so, we can now calculate the error ratio of the raw frequency by dividing it by `pitch.frequency`. `errRatio` will then be a number between 0.5 and 2.0 such that `frequency * errRatio` == (Frequency of the nearest note [aka `pitch.frequency`]).

<br />

Lastly, we inform other delegate classes by calling the `tunerDidTick(pitch:errRatio)` function. The delegate protocol should be implemented as thus. (The code should be written out of the `Tuner` class.)

{{< highlight swift "linenos=table" >}}
protocol TunerDelegate {
    func tunerDidTick(pitch: Pitch, errRatio: Double)
}
{{< / highlight >}}

<br />

The view class could then utilize the `Tuner` class by adopting the `TunerDelegate` protocol, calling `start()` to start, implementing `tunerDidTick(pitch:errRatio:)` to receive processed information of the tuner, and calling `stop()` to stop the tuner.

<br />

Nice.