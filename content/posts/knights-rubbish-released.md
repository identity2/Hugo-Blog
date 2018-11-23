---
title: "Knights Rubbish Released"
date: 2018-11-23T11:40:19+08:00
draft: false
---

{{< youtube bNIsr0Maho4 >}}

<br />

My second game project [Knights Rubbish](/knights-rubbish) has released!

<br />

Originally I was just doing some experiments with Godot Engine and trying to implement the barebones of a platformer, but then the project grew larger and larger as I combined it with other mechanics I was testing. After a year and couple of months, Knights Rubbish was born!

## Real Photos as Game Graphics
One of the coolest features in Knights Rubbish is that most of its graphics are made with processed photos. Whenever I needed game graphics for objects in the game, I simply picked up my phone, took pictures of some random items at my home and editted them using Affinity Photo. This gave Knights Rubbish a bizarre 2D photo-realistic feel, which unexpectedly, is super decent!

<br />

Another unexpected thing is that I thought editting photos for game graphics costs less time then drawing game graphics by hand. I was wrong. Editting photos is as time-consuming and more tedious than drawing. However, evaluating my art skills, maybe I'll never be able to create photo-realistic game art. 

## Platformer Fighter with Local Co-op
I really enjoyed the fun of cooperating with a friend and fight through mobs and bosses of a game when I was a kid, so I planned to make Knights Rubbish a local co-op action platformer. When designing the mechanics of Knights Rubbish, I did research on three of my past favorite games for reference: Metal Slug, Super Smash Bros, and Maplestory.

<br />

The camera movement of Metal Slug is smooth and well-designed, so I watched some gameplay videos of it and learned how to position and move the camera according to the characters' position on screen (especially when there are two player-controlled characters on screen). I wrote two articles on camera movements while I was doing this research:

* [Camera Moving & Scene Scrolling in Metal Slug 3](/posts/camera-moving-scene-scrolling-in-metal-slug-3)
* [Customized 2D Following Camera in Godot](/posts/customized-2d-following-camera-in-godot)

<br />

Super Smash Bros is famous for its intuitive yet comprehensive combo-casting system, so I designed Knights Rubbish's combo system accordingly:

* **[Up + Skill]** for upward movement.
* **[Down + Skill]** for defensive skill.
* **[Left/Right + Skill]** for horizontal or ranged attack.
* **[Skill]** for basic skill.

The difference is that instead of "Attack-key Combos" (or charged attacks) in Smash Bros, the **[Attack]** key in Knights Rubbish only defines one simple attack move. I designed it this way because I consider that charged attacks are fun due to the demonstration of skills between two more advanced players, however, Knights Rubbish is only a casual game where two players cooperate against enemies. Therefore, the addition of Attack-key Combos would only increase the complexity of Knights Rubbishh, not providing the game with more fun.

<br />

Maplestory is enjoyable due to the variety of mobs and the sense of satisfaction after defeating bosses (with friends). I studied some enemy behaviors and boss designs of the game and came up with several bosses and over 20 mobs for Knights Rubbish. They were all implemented with simple state machines so that the code base is easier to manage.

## Made with Godot
Godot is such a powerful and wonderful project for game developers, especially for hobbyists and indies. It is opensource, free, customizable, and comparable with modern commercial game engines. I'm really thankful of the contributors and the kind community for helping me out during the development of Knights Rubbish, and if Knights Rubbish actually profits (which um... is kind of unlikely to be honest), I'll definitely donate a pecentage of the earnings to Godot.

## Links
[Knights Rubbish Homepage](/knights-rubbish)

[Introduction to the Knights](/knights-rubbish-heroes/the-knights)

[Steam Store](https://store.steampowered.com/app/980440)

[itch.io Store](https://shinerightstudio.itch.io/knights-rubbish)

## Conclusion
Another game title under by belt. Yay.