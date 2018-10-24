---
title: "Music Syncing in Rhythm Games"
date: 2017-03-12T23:12:00+08:00
thumbnail: ""
static_page: false
draft: false
---
Recently, I've started my beatbox rhythm game project [Boots-Cut](/boots-cuts) using Unity. When prototyping the basic game mechanics, I found that it is quite tricky to sync the music notes with the music correctly. However, there are very little articles on the web concerning this subject. So, I will try to point out some important tips when developing a rhythm game (especially in Unity) in this article.

<br />

Among all, I found the following three points with most importance:

* Use `AudioSettings.dspTime` instead of `Time.timeSinceLevelLoad` to keep track of the position of the song.
* Always use the position of the song to update movements.
* Don't update music notes by time differences every frame, interpolate them.

Keep these in mind, and let's get started!

### The Main Class
A `SongManager` class should be created for song position tracking, music note spawning, and other song managing stuffs.

##### Position Tracking
In all rhythm games, we have to track the song position to determine whether a note should be spawned. Below are the essential fields for song position tracking:

{{< highlight csharp "linenos=table" >}}
//the current position of the song (in seconds)
float songPosition;

//the current position of the song (in beats)
float songPosInBeats;

//the duration of a beat
float secPerBeat;

//how much time (in seconds) has passed since the song started
float dsptimesong;
{{< / highlight >}}

We initialize these fields in the `Start()` function:

{{< highlight csharp "linenos=table" >}}
void Start()
{
    //calculate how many seconds is one beat
    //we will see the declaration of bpm later
    secPerBeat = 60f / bpm;
    
    //record the time when the song starts
    dsptimesong = (float) AudioSettings.dspTime;

    //start the song
    GetComponent<AudioSource>().Play();
}
{{< / highlight >}}

We convert `bpm` to `secPerBeat` for convenience. Later on, `secPerBeat` would be used to calculate the song position in beats, which is very important for note spawning.

<br />

Also, we record the start time of the song in `dsptimesong`. We use `AudioSettings.dspTime` instead of `Time.timeSinceLevelLoad` because `Time.timeSinceLevelLoad` is updated only in each frame while `AudioSettings.dspTime` updates more frequently because it is the timer of the audio system. To keep in pace of the song, we have to use the timer of the audio system to avoid the latency caused by the time differences between frame updates and audio updates.

<br />

In the `Update()` function, we also calculate the position of the song by `AudioSettings.dspTime`:

{{< highlight csharp "linenos=table" >}}
void Update()
{
    //calculate the position in seconds
    songPosition = (float) (AudioSettings.dspTime - dsptimesong);

    //calculate the position in beats
    songPosInBeats = songPosition / secPerBeat;
}
{{< / highlight >}}

We calculate the position-in-seconds in a song simply by subtracting the current `AudioSettings.dspTime` by the time in the start of the song (aka. `dsptimesong`). We now have the position-in-seconds of a song, however, in the world of music, we record our notes in beats. So, it is better to convert the position-in-seconds to position-in-beats. Dividing `songPosition` by `secPerBeat` ( second / (second / beat) ), we will get the position-in-beats.

<br />

Consider the note below:

![picture1](/posts/music-syncing-in-rhythm-games/pic1.png)

The position-in-beats of the notes are 1, 2, 2.5, 3, 3.5, 4.5, and a beat lasts for 0.5 seconds. So, if 1.75 seconds have passed in the song (aka. `songPosition == 1.75`), we know that we now reaches the **1.75** (`songPosition`) / **0.5** (`secPerBeat`) = **3.5** beat in the song, and the note in 3.5 beat should be spawned.

###### Song Information
Move on to the fields which we record the information of the song:

{{< highlight csharp "linenos=table" >}}
//beats per minute of a song
float bpm;

//keep all the position-in-beats of notes in the song
float[] notes;

//the index of the next note to be spawned
int nextIndex = 0;
{{< / highlight >}}

For simplicity, I demonstrate the song with only one track of notes (*Guitar Hero Mobile* has three tracks, while *Taikono Tatsujin* has only one track).

<br />

`bpm` is the beats per minute of a song. As we have seen, it would be converted to `secPerBeat` for convenience.

<br />

`notes` is an array which keeps the entire position-in-beats of the notes in the song. For example, `notes` would be `{1f, 2f, 2.5f, 3f, 3.5f, 4.5f}` for the note below:

![picture1](/posts/music-syncing-in-rhythm-games/pic1.png)

Lastly, `nextIndex` is simply an integer used to traverse the array. It is initialized to 0 since the next note to spawn is the very first note of the song. We would increment `nextIndex` whenever a note is spawned.

##### Spawning the Notes
We determine whether a note should be spawned in the `Update()` function. However, we should first determine how many beats would be shown in advance.

<br />

For example, in the following track,

![picture2](/posts/music-syncing-in-rhythm-games/pic2.png)

The current songposition-in-beats is 1, but beat 3 is already spawned, meaning 3 beats are shown in advance.

<br />

Just below `songPosInBeats = songPosition / secPerBeat;`, add the following lines:

{{< highlight csharp "linenos=table" >}}
if (nextIndex < notes.Length && notes[nextIndex] < songPosInBeats + beatsShownInAdvance)
{
    Instantiate( /* Music Note Prefab */ );

    //initialize the fields of the music note

    nextIndex++;
}
{{< / highlight >}}

We first check if there are no notes left in the song (`nextIndex < notes.Length`), if there are notes left, we then see if the song reaches the beat where the next note should be spawned (`notes[nextIndex] < songPosInBeats + beatsShownInAdvance`). If it does, spawn the note and increment `nextIndex` so that it now keep tracks of the next note to spawn.

##### Moving the Notes
Lastly, we talk about how to move the notes we spawned according to the song. It is quite easy if you remember the point: **Don't move them by time differences of frames, interpolate them**.

<br />

Always update movements by the position of the song because

1. Audio timer has time difference with frame timer
2. Beats may be right in the middle of two frames (which cause time difference)

...so, how exactly to move the notes? **INTERPOLATE**!

<br />

For simplicity, I will spare all the code in the `MusicNote` class, and include only the `Update()` function where we move each music note:

{{< highlight csharp "linenos=table" >}}
//the update function of music notes
void Update()
{
    transform.position = Vector2.Lerp(
        SpawnPos,
        RemovePos,
        (BeatsShownInAdvance - (beatOfThisNote - songPosInBeats)) / BeatsShownInAdvance
    );    
}
{{< / highlight >}}

The below graph should show this clearly:

![picture3](/posts/music-syncing-in-rhythm-games/pic3.png)

### Conclusion
These are the basics of how to program a rhythm game. By following the principles, hopefully, you could make any kind of song-synchronizing games. Multiple-tracked games could be created by making a nested `notes` array, removal of notes could be done by checking if its position reaches the removal line, long duration notes could be implemented by keeping track of both the start beat and end beat, etc.

<br />

Thanks a lot for reading the article and hope that it helps. My own rhythm game [Boots-Cuts](/boots-cuts) would be out in the next couple of years, stay tuned for more information! :D

<br />

**2018.10.24 Update:** I wrote a minimal rhythm game sample project in Unity. Feel free to download and play with the code. [View On GitHub](https://github.com/casd82/Rhythm-Game-Sample)