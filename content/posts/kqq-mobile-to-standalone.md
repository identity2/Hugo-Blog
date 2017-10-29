---
title: "kQq: Mobile to Standalone"
date: 2017-04-02T22:13:00+08:00
thumbnail: ""
static_page: false
draft: false
---
I've published my first game [kQq](/kqq) on iOS App Store and Google Play in February. Though the sales were far from success, I've learned a lot (or rather I like to use this excuse as self-consolation...). Thinking that this game would also work on standalone platforms and that I would gain some precious experiences by porting the game to standalone platforms, I started working on the redesign of the project and published a Steam Greenlight page for it.

[kQq Steam Greenlight link](http://steamcommunity.com/sharedfiles/filedetails/?id=883429236)

### Modifying the Orientation
The major task of porting kQq to standalone platforms is to modify the orientation of the game from portrait to landscape. I did not think of publishing kQq on standalone platforms in the beginning of the project, so I designed kQq to display in portrait. As bad luck would have it, since I'm going to publish the game on standalone platforms now, I would have to redesign most of the UI elements as well as some game levels to suit the big landscape screens of standalone devices better.

<br />

The original portrait screen for mobile devices:

<img src="http://i.imgur.com/ouvch3W.png" style="width:180px;height:320px;" />

<br />

The modified landscape screen for standalone devices:

<img src="http://i.imgur.com/YJcdCPZ.png" style="width:640px;height:360px;" />

### Level Redesign
Since standalone devices have bigger screens and faster speed, it is more desirable to redesign the game levels, graphics, and UI elements to meet the standards of standalone games. After all, haters on Steam Greenlight often leave "Take this $hit to mobile!" as their comments, and in fact, most PC gamers have higher expectation than mobile gamers.

<br />

One of the original levels on mobile version:

<img src="http://i.imgur.com/L1m9sqf.png" style="width:180px;height:320px;" />

<br />

One of the redesigned levels on standalone version:

<img src="http://i.imgur.com/kX2XBUQ.png" style="width:640px;height:360px;" />

##### Movie Texture
A downside of making mobile games in Unity is that the engine doesn't support in-game video playback (i.e. Movie Texture) on iOS and Android, so the mobile version of kQq has to switch back and forth between the native video player app and the actual game to play the pre-level animations (because I saved them as .mp4 files).

<br />

Changing to standalone platforms, I could simply play the pre-level animations in game scenes. To play the animations in a more interesting way, I created a little movie screen UI which would perform a "drop down" animation upon playing videos.

<br />

The little movie screen:

<img src="http://i.imgur.com/zB0d3Jp.png" style="width:640px;height:360px;" />

### Steam Greenlight Progress
Yes, I've published the game on Steam Greenlight, but the relentless truth is that it probably wouldn't get greenlit. kQq is on Steam Greenlight for three days now, however, the number of new visitors on the page drops from above a hundred to only a few after the first day. What's worse, the yes/no rate for kQq is a disaster, it barely reaches 20%. Maybe kQq just isn't tempting enough or it simply doesn't fit the standalone market. I'm still working hard on marketing and polishing the game though. Hope that it could be successfully published on standalone platforms eventually (even if it doesn't profit).

<br />

Edited on 2017.10.29: As expected, kQq is a failure on Steam Greenlight. Now Valve comes up with a new Steam Direct system for develop so that everyone can upload their game on Steam. However, I'm quite hesitant to bring kQq up to Steam since it seems that 2D puzzle games has an extremely small market on standalone platforms.