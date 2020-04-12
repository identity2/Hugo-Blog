---
title: "Recording and Playing Audio in Unity"
date: 2017-03-05T13:31:00+08:00
thumbnail: ""
static_page: false
draft: false
---

Just published my [Recordable Launchpad](/recordable-launchpad) app on the iOS App Store and Google Play! Actually, the project was created accidentally  when I was testing out Unity In-App Purchase, Google Admob Unity SDK, the "Prepare iOS for Recording" checkbox, and Audio Latency.

<br />

Since integrating Unity In-App Purchase and Google Admob are rather straightforward, I would be writing mostly about (the more troublesome parts, which are)

* Serializing and Deserializing `AudioClip`s
* Getting Rid of Audio Latency
* **Prepare iOS for Recording** and `iPhoneSpeakerFix`

in this article.

### Get Rid of Audio Latency
When playing audio effects in Unity, there are always some 0.1-0.5 seconds of latency, which is extremely annoying. The problem is rather simple to fix, but I actually spent a lot of time searching for the best solution.

<br />

One method is to use .wav files instead of .mp3 because there would always be some overheads in decompressing .mp3 files. (However, .wav files are much larger...which is fine for short audio effects though)

<br />

The other method is really trivial, but it actually solved the problem for me. Just select **Best Latency** in **Project Settings -> Audio -> DSP Buffer Size**, and the job is done!

<br />

Nonetheless, some Android devices may still have some noticeable latency due to the variety of audio hardwares on different devices. The only solution to the problem may be writing native Android plugins.

### Prepare iOS for Recording and iPhoneSpeakerFix
In iOS, the `Microphone.Start()` call is always laggy. Fortunately, Unity provides a **Prepare iOS for Recording** checkbox in **Player Settings**. Though **Prepare iOS for Recording** solves the `Microphone.Start()` latency, it generates another issue: *All of the audio would come out from the small earphone on the top of the phone instead of the bottom speakers!* This is really irritating since the volume would be extremely low, and the quality of audio would be very bad.

<br />

After days of searching, I finally found a nice solution on GitHub: [UnitySpeakerFix](https://github.com/cbaltzer/UnitySpeakerFix). This little plugin written by [cbaltzer](https://github.com/cbaltzer) is extremely simple to integrate. Just copy and paste the files and add

{{< highlight csharp "linenos=table" >}}
iPhoneSpeaker.ForceToSpeaker();
{{< / highlight >}}

after every `Microphone.Start()` call, and boom! The audio would now come perfectly out of the speakers again!


### Serialize AudioClip
In my [Recordable Launchpad](/recordable-launchpad) app, I saved the recorded `AudioClip`s in binary files. Whenever the app is started, the `AudioClip`s are deserialized from the local binary files, and when the app quits, the `AudioClip`s are serialized and saved in the local directory.

<br />

The most important points when serializing or deserializing `AudioClip`s are

* Get new `AudioClip` instances by `AudioClip.Create()`.
* `AudioClip` in Unity consists of three important fields: `frequency`, `samples`, and `channels`.
* The actual audio samples are stored in a `float` typed array (`float[]`) called `sample`, where the length is `channels` multiplied by `samples`.
* Copy audio samples by the `AudioClip.GetData()` and `AudioClip.SetData()` functions.

So, firstly, we should create a serializable class to store `AudioClip`:

{{< highlight csharp "linenos=table" >}}

[Serializable]
class AudioClipSample
{
    public int frequency;
    public int samples;
    public int channels;
    public float[] sample;
}

{{< / highlight >}}

Then, the serialize and deserialize code should be quite simple:

<br />

**Deserialize AudioClip from local file and set to AudioSource**

{{< highlight csharp "linenos=table" >}}
public static void LoadAudioClipFromDisk(AudioSource audioSource, string filename)
{
    if (File.Exists (Application.persistentDataPath + "/"+ filename)) {
        //deserialize local binary file to AudioClipSample
        BinaryFormatter bf = new BinaryFormatter ();
        FileStream file = File.Open (Application.persistentDataPath + "/" + filename, FileMode.Open);
        AudioClipSample clipSample = (AudioClipSample) bf.Deserialize (file);
        file.Close ();

        //create new AudioClip instance, and set the (name, samples, channels, frequency, [stream] play immediately without fully loaded)
        AudioClip newClip = AudioClip.Create(filename, clipSample.samples, clipSample.channels, clipSample.frequency, false);

        //set the actual audio sample to the AudioClip (sample, offset)
        newClip.SetData (clipSample.sample, 0);

        //set to the AudioSource
        audioSource.clip = newClip;
    }
    else
    {
        Debug.Log("File Not Found!");
    }
}
{{< / highlight >}}

<br />

**Serialize AudioClip to local file**

{{< highlight csharp "linenos=table" >}}
public static void SaveAudioClipToDisk(AudioClip audioClip, string filename)
{
    //create file
    BinaryFormatter bf = new BinaryFormatter ();
    FileStream file = File.Create (Application.persistentDataPath+ "/" + filename);

    //serialize by setting the sample, frequency, samples, and channels to the new AudioClipSample instance
    AudioClipSample newSample = new AudioClipSample();
    newSample.sample = new float[audioClip.samples * audioClip.channels];
    newSample.frequency = audioClip.frequency;
    newSample.samples = audioClip.samples;
    newSample.channels = audioClip.channels;

    //get the actual sample from the AudioClip
    audioClip.GetData (newSample.sample, 0);

    bf.Serialize (file, newSample);
    file.Close ();
}
{{< / highlight >}}

The full source code can be found on my [GitHub](https://github.com/YuChaoGithub/Unity-Scripts/blob/master/AudioClipSerializer.cs)