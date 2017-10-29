---
title: "Camera Moving Scene Scrolling in Metal Slug 3"
date: 2017-10-01T17:01:00+08:00
thumbnail: ""
static_page: false
draft: false
---
I've started to work on my first 2D side scrolling platformer recently. However, before diving into designing my own game, I did some quick research on various topics about 2D platformers. One of them is camera controlling (aka. scene scrolling).

<br />

I find some interesting camera controlling technique used in the Metal Slug series, so I would like to share my observations and analysis of how and when to apply those camera controlling schemes.

<br />

(Note that since there really isn't standard terminology in camera controlling, I try to name each scheme as intuitive as it can be.)

#### Single Static Line Scrolling
![Clip 1](/posts/camera-moving-scene-scrolling-in-metal-slug-3/Clip1.gif)

This is a really common scheme for side scrolling games where a (imaginary) static line is positioned somewhere in the screen, when the character reaches the line, the scene will be scrolled further. Note that the scene wouldn't scroll back at all so the character will bump at the left most of the screen.

<br />

Single Static Line Scrolling should be used when the character is about to travel for some distance where enemies are mostly invading from the right side of the screen. This provides more reaction time for the players since there will be a gap  wide enough between the character and the positions where the enemies are spawned. In addition, since the scene will never scroll back, don't use Single Static Line camera scrolling if the character is required to traverse back and forth in the level.

#### Limited Scrolling
![Clip 2](/posts/camera-moving-scene-scrolling-in-metal-slug-3/Clip2.gif)

Simply put, Limited Scrolling generally means no scrolling at all. However, in some cases, Limited Scrolling allows the camera to move back and forth a little bit like the example below.

![Clip 5](/posts/camera-moving-scene-scrolling-in-metal-slug-3/Clip5.gif)

In Limited Scrolling, the character can only stay in some limited area of a scene. In other words, the scene won't scroll past its left and right boundaries. As you can see in the first gif, when the character passes the red line, the scene no longer scrolls further since the right edge of the camera reaches the right boundary of the scene.

<br />

Limited Scrolling is often used when you don't want the players to see beyond some obstacles before they are destroyed (refer to the first gif). On top of that, limited scrolling is also useful for cases when you want to force the players to stay in a certain area until all the enemies are cleared (refer to the second gif).

#### Repositioning Scrolling
![Clip 3](/posts/camera-moving-scene-scrolling-in-metal-slug-3/Clip3.gif)

Repositioning Scrolling is used to switch from Limited Scrolling to Single Static Line Scrolling. As the gif shows, after the obstacle is destroyed, the character snaps quickly back to the red line.

<br />

Clear enough, Repositioning Scrolling should be applied whenever you wish to switch back to Single Static Line Scrolling, where future enemies are coming from the right of the screen.

#### Constant Speed Scrolling
![Clip 7](/posts/camera-moving-scene-scrolling-in-metal-slug-3/Clip7.gif)

In Constant Speed Scrolling, no matter how the character moves, the scene keeps on scrolling to the right. In this scenario, the boat is moving at the same speed as the camera, so it looks a lot like Limited Scrolling. (Well, actually, the devs could implement this scene in either way.) Note that when the boat reaches the jeep, it switches to Limited Scrolling, and when the jeeps is destroyed, it switches back to Constant Speed Scrolling.

<br />

Constant Speed Scrolling would work perfectly if the character is standing on some objects moving at a constant velocity such as a magic carpet, an elevator, or in this case, a boat.

#### Single Static Line Scrolling -> Limited Scrolling -> Reposition Scrolling
This pattern is used everywhere in Metal Slug 3, so I will show some examples of it.

###### Encountering Obstacle
When encountering obstacles, this pattern is frequently used.

![Clip 4](/posts/camera-moving-scene-scrolling-in-metal-slug-3/Clip4.gif)

At first, Single Static Line Scrolling is applied since the character is traveling from left to right and the invaders are coming from the right of the screen.

<br />

Then, however, an obstacle appears, so it switches to Limited Scrolling, which the character couldn't see past the gate and can only head back a little bit.

<br />

When all the crabs are eliminated, the obstacle collapses and a Reposition Scrolling makes the character snap back to the red line.

###### All direction invasion
Enemies usually invade from the right of the screen in Metal Slug, however, sometimes, to make the gameplay more intense, there will often be some situations where enemies invade from all top, left, and right directions. In this scenario, it is a good idea to switch to Limited Scrolling since there will be more space between the left edge of the screen and the character, letting them have more time to react to enemies invading from the left.

![Clip 5](/posts/camera-moving-scene-scrolling-in-metal-slug-3/Clip5.gif)

![Clip 6](/posts/camera-moving-scene-scrolling-in-metal-slug-3/Clip6.gif)

As you can see, after all the enemies are cleared, it switches back to Static Line Scrolling, since further game elements are coming from the right of the screen.

#### Conclusion
There are still many camera controlling schemes for other side scrolling games, however, the schemes used in Metal Slug are well designed and will be suitable for most of the situations.

<br />

Lastly, Hope that you enjoy reading this article! I'm planning on posting some articles about different game design topics in the future. Stay tuned!