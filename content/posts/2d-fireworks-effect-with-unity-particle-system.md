---
title: "2D Fireworks Effect with Unity Particle System"
date: 2017-04-16T18:43:00+08:00
thumbnail: ""
static_page: false
draft: false
---
Using particle systems is a wonderful way to improve the juiciness as well as the aesthetics of your game.

<br />

When making my rhythm game [Boots-Cuts](/boots-cuts), I used the particle system in Unity to display a little firework effect whenever a music note is hit on-beat.

![Boots-Cuts](http://i.imgur.com/z0v876s.gif)

In this article, I'll demonstrate how to make such an effect.

## Texture and Material
First, we'll have to import the the graphics which we would like the particle systems to emit (aka. the small stars & circles).

<br />

Since the effect is only be displayed in a 2D scene, so a 2D sprite texture should be okay.

![2D Texture](/posts/2d-fireworks-effect-with-unity-particle-system/2d-texture.png)

After importing the 2D texture, we'll have to make it a material so that the particle system could render it.

<br />

Create a new **material** in Unity, and set the shader to either **Particles/Alpha Blended** or **Mobile/Particles/Alpha Blended** depending on your target platform (the one with "Mobile" would have better performance).

<br />

Simply drag the 2D texture you've imported to the inspector, and the configuration of the **material** is done.

![Material](/posts/2d-fireworks-effect-with-unity-particle-system/material.png)

Now you have the proper material, let's head on to the particle system itself.

## Particle System
Create a new **Particle System** in your scene, and you'll notice that there's a long list of settings to be configured.

![Particle System](/posts/2d-fireworks-effect-with-unity-particle-system/particle-system.png)

We'll go through all the required settings step by step.

#### Particle System Panel
Expand the **Particle System** panel, you'll see the settings below:

<br />

**Duration** - This is the duration of the whole particle system animation. I'll set this to **0.5** because the firework effect I use is quick and short.

<br />

**Looping** - This simply means whether the animation would be looping over and over again or not. I'm only playing the particle systems *once* whenever an on-beat music note is hit, so it definitely shouldn't be checked.

<br />

**Start Lifetime** - This indicates the lifetime of each particle (aka. a single star). I'll set it to a constant which equals to the **Duration (0.5)**, so that every particles would appear on start and disappear simultaneously when the animation ends.

<br />

**Start Speed** - This is the speed of each particle upon emission. I'll set it to a constant (**6**), so that each particle has the same emission speed (which simulates the firework explosion in real world).

<br />

**Start Size** - This configures the sizes (scale) of each particle. I'll make each particle have a different size (to make the effect more natural) by setting their sizes between two constants **[0.2, 1.5]** (click on the small triangle at the right of the panel, and select **Random Between Two Constants**).

<br />

**Start Color** - This simply means the color of each particle. I'll set all the particles to the same color, and the color depended on which music track the effect is being played on.

<br />

**Gravity Modifier** - This indicates the gravity applied to every particle. Since the particles (or dusts) of a firework (unfortunately) falls from the sky in the real world, setting a gravity modifier to the particle system would make the effect seem more natural. Through trail and error, I found that a **2.5** gravity modifier seems the best.

<br />

**Play On Awake** - This means that whether the particle system would be played automatically when the scene is loaded (just like the `Awake()` function in scripting). I'd like the particle system to be played only if an on-beat hit is performed, so I unchecked it.

<br />

The final configuration of my **Particle System** panel looks like this.

![Particle System Panel](/posts/2d-fireworks-effect-with-unity-particle-system/particle-system-panel.png)

#### Emission
Emission is quite simple. Fireworks emit particles in one single burst, so we should set **Rate Over Time** (The rate which particles continuously emit over time) to **0**. Next, click the + sign at the bottom right corner to add a *burst* to the particle system. The burst **Time** should be set to **0** so that the particles would be emitted in the beginning of the animation. **Min** means the minimum amount of particles to be emitted in this *burst*. Similarly, **Max** means the maximum amount of particles to be emitted in the *burst*. I set them to **30** and **50** so that the animation seems different, but not too different each time.

![Emission](/posts/2d-fireworks-effect-with-unity-particle-system/emission.png)

#### Shape
Shape configures the shape which the particles would be emitted from. A firework bursts from a single point to a circular ring, so we should set the shape to **Circle**.

![Shape](/posts/2d-fireworks-effect-with-unity-particle-system/shape.png)

#### Color Over Lifetime
Skip some of the settings which we won't be using, and move on to the **Color Over Lifetime** panel.

<br />

If you've ever seen a firework show, you'll notice that whenever fireworks explode in the sky, the particles are bright and colorful. However, within a second, the shiny particles would dim over time and at last vanish.

<br />

To apply such an effect to our particle system, we should set **Color over Lifetime** to **Gradient**. And the gradient color should be set between full alpha (**255**) to zero alpha (aka. transparent) (**0**).

![Color Over Lifetime](/posts/2d-fireworks-effect-with-unity-particle-system/color-over-time.png)

#### Renderer
Now the behaviors of the particle system are all fine, we just need to set the **Material** of the particle system to the one we've created previously. Furthermore, the **Min/Max Particle Size** could also be configured in the **Renderer** panel to fine tune the particle system.

![Renderer](/posts/2d-fireworks-effect-with-unity-particle-system/renderer.png)

The firework effect is done!

## Conclusion
Particle systems are pretty fun to play with, and by applying them correctly in your games, your games would seem more polished and would have a better overall feeling.

<br />

Thanks for reading the article, and hope you've learned something!

<br />

**Self Promotion Time :D** - My game [kQq](http://steamcommunity.com/sharedfiles/filedetails/?id=883429236) is on Steam Greenlight now! If you think the game is worth being published, please vote for it!