---
title: "A Brief Review of Godot Engine"
date: 2017-07-23T15:11:00+08:00
thumbnail: ""
static_page: false
draft: false
---
After finishing 2 of my projects in Unity, I was planning to try out something different and hopefully, more suitable for me to use. I did a quick research on some modern cross platform game engines: [Godot](https://godotengine.org/features), [Cocos2d-x](http://www.cocos2d-x.org), [Atomic](https://atomicgameengine.com), [Love2D](https://love2d.org), [Phaser](https://phaser.io), and of course, [Unreal](https://www.unrealengine.com). I finally decided to look more into Godot Engine. In this article, I will write briefly about the features, the special node-scene system, as well as the pros and cons of Godot Engine. But before doing so, make sure you pronounce Godot right: [GOD-oh](https://www.youtube.com/watch?v=JU8v7SP0L4s).

## Basic Information
* Deployment: iOS, Android, macOS, Windows, Linux,  BSD, Haiku, Blackberry OS.
* Editor Platforms: macOS, Windows, Linux, FreeBSD, OpenBSD and Haiku.
* Engine written in: C++.
* Scripting Languages: GDScript.
* 2D & 3D games.
* License: MIT.

#### Deployment Target
With the ever-increasing variety of gaming devices, it is vital that modern game engines be capable of deploying your games on multiple platforms. In Godot, you will be able to ship your games to almost all modern gaming devices by a simple click. Below is the project building window, you can see that switching platforms is extremely easy and effortless.

![Deployment Target](/posts/a-brief-review-of-godot/Godot1.png)

#### Editor
Godot has a well-designed UI editor, so editing levels, viewing scenes, configuring properties of game entities are straightforward. The editor could be installed on almost all popular operating systems, this makes Godot a fantastic choice for game developers on Linux. Also, The editor is pretty lightweight comparing to other engines with UI editor. It occupies only around 20MB disk space.

#### Written in C++
I believe that most modern game engines are written in C++ (or C) because it is the only way to make an engine efficient and cross-platform. Godot is not an exception. What's better, since Godot is published under the MIT license, you have full access to its C++ source code and tailor-make Godot engine to fulfill the needs of your own games. This is done by writing customized C++ code, add it to the Godot source code as *modules*, and recompile the source code. This could be done easily using GDNative after the release of Godot 3.0, but for now, writing modules is the only way to customize the engine.

#### GDScript
When developing games in Godot, almost all of the gameplay code should be written in GDScript. It is a dynamic-typed scripting language. It is extremely similar to Python and most of the programmers could pick it up in couple of hours. Below is an excerpt of the player movement script for my project.

{{< highlight python "linenos=table" >}}
func _ready():
    set_process(true)

func _process(delta):
    # Horizontal inputs.
    if Input.is_action_pressed("player_left"):
        horizontal_movement -= 1
    elif Input.is_action_pressed("player_right"):
        horizontal_movement += 1

    velocity.x = horizontal_movement * speed
    move(velocity * delta)
{{< / highlight >}}

Godot editor provides a pretty nice text editor for GDScript. It's functionality includes keyword highlighting, auto-indentation, auto-complete, and debugging. Though GDScript still lack some common features of modern programming languages such as `switch`-`case`, all in all, its still a well-designed and easy-to-use scripting language.

## Node-Scene System
Godot's workflow is similar to most game engines with a UI editor. However, different from most component-based engines, Godot has its unique **scene**-based system.

#### Node
In Godot, game entities are called **nodes**, a node

* Has a name.
* Has editable properties.
* Can receive a callback to process every frame.
* Can be extended (to have more functions).
* Can be added to other nodes as children.

So, typically, nodes in Godot are in the structure of *trees*.

![Nodes](http://docs.godotengine.org/en/stable/_images/tree.png)

(Image from Godot Documentation)

#### Scene
When organizing nodes hierarchically in the editor, it becomes a **scene**. A scene in Godot has the following properties

* A scene always has only one root node.
* Scenes can be saved to disk and loaded back.
* Scenes can be instanced.
* Running a game means running a scene.
* There can be several scenes in a project, but for it to start, one of them must be selected to be loaded first.

Below is an example of a scene in Godot.

![Scene](http://docs.godotengine.org/en/stable/_images/scene_tree_example.png)

(Image from Godot Documentation)

Comparing to component-based system, node-scene system abides better to object-oriented programming principles, but some people (including me) may not be used to the fact that only one script could be attached to a node. Fortunately, you can also make your game in a component-based way in Godot by adding child nodes as *components* of the parent node. So, generally, I guess node-scene system is equally flexible (if not more) compared to the well-known component-based system.

## Pros & Cons
Actually, it is hard to classify which features are pros and which are cons for a game engine, since different people have different preferences and different games have different needs. So, I will try to be as objective as possible and list the pros and cons of Godot engine by seeing which features are generally regarded as pros and which are regarded as cons by most developers.

#### Pros
**Dedicated 2D engine** - In Godot, you can manipulate game entities in pixels, which makes it easier and more intuitive to develop 2D games. Also it has a 2D physics engine, which is essential for making complex physics-based 2D games.

<br />

**Open Source, MIT license** - You can view the full source code of Godot to learn the architecture and design of the code. Furthermore, you can modify the source code to optimize or customize Godot engine to fill your own needs.

<br />

**Built-in cut-out animation** - The animation system is pretty neat in Godot. You can animate any properties of a node, saving you much time in writing code for animation. On top of that, you can assign skeletons to sprite nodes to let them perform nice looking skeletal animations. Overall, the built-in animation saves a lot of budget and time for developers to make good looking animations.

<br />

**Multi-platform deployment & development** - The game could be developed in many operating systems and be deployed to most gaming devices in a single click. 

<br />

**Lightweight** - The full size of Godot editor is only around 20MB.

<br />

**Git-Friendly** - Most game engines have problem working seamlessly with version control softwares. They usually generate tons of meta files for version controlling. Godot engine, on the other hand, works elegantly with version controlling softwares such as Git since they use plain text files for scene and game entities.

<br />

**The logo is cute**

![Godot](/posts/a-brief-review-of-godot/icon.png)

#### Cons
**Community is rather small** - Though Godot has an active community, compared to Unreal and Unity, the community size of Godot is really small. This means that if you have questions or something you want to discuss, less people could help you out.

<br />

**Documentation lacks description and code demo** - To learn a new framework, detailed documentation could help a lot. However, currently, Godot's documentation lacks descriptive details and code demos. If you want to use a function, you have to test it out yourself. This is rather time-consuming for new developers. Hope that Godot could be better documented in the future.

<br />

**3D Features are incomplete** - Actually I'm not quite sure about this point since I haven't tried out the 3D engine of Godot. I just hear a lot of people complaining about Godot's 3D functionality, so I list this point here. So don't take this point serious, make sure to test out on your own. (They are currently working on the 3D engine with extreme efforts, and they plan to release the improved 3D engine in Godot 3.0).

<br />

**Less 3rd Party APIs** - Since the user base of Godot is relatively small, most 3rd party softwares (such as Admobs, Firebase) don't provide APIs for Godot. However, since Godot is written in C++, if the plug-in you're using provides a C++ API (which very likely it does), you can still integrate it with Godot using modules. It just cost more time and efforts.

## Waiting for Godot 3.0
The release of Godot 3.0 is around the corner. The developers are adding fantastic features to Godot and making almost every existing features better. Below is a brief list of new features they plan to release with Godot 3.0.

<br />

**GDNative** - This is the feature I look forward the most. Instead of writing modules and recompiling the source code again, GDNative provides a simple way to integrate native C++ code with Godot. Not only performance critical code could be written but also 3rd party C++ APIs could be added to the code base easily with GDNative.

<br />

**Visual Scripting** - The developers are adding a new visual scripting functionality for Godot 3.0. This makes it easier for non-programmer developers to modify or create simple game logic without writing code. However, if you are coming from a CS background (like me), visual scripting wouldn't be the most tempting way to develop a game.

<br />

**VR/AR Support** - With the ever-increasing popularity of VR/AR games, Godot 3.0 is going to integrate OpenVR with Godot API.

<br />

**New Particle System** - Particle systems are indispensable in modern games. Due to that, Godot is making a new particle system with good performance.

<br />

**New Renderer** - As mentioned in the previous section, Godot's current 3D engine is not working pretty well. In Godot 3, however, they are working really hard on a new renderer. So hopefully, Godot 3.0 will have an extremely better 3D engine.

<br />

**Multi-language Bindings** - Though I suggest that GDScript is a well designed and easy-to-use language. However, people coming from different backgrounds have diversified preferences. In Godot 3.0, they plan to add language bindings for Python, C#, Lua, and D, so developers could work with the language they like.

<br />

**Experience the actual feeling of Waiting for Godot** - Yeah, the essence of Godot is that you have to be waiting for it. Waiting for Godot 1.0, waiting for Godot 2.0, and now, it's waiting for Godot 3.0. You have be waiting...([or contribute some to it](https://github.com/godotengine/godot)).

## Conclusion
Overall, I really like Godot engine and its community. Since it is an open source project, its development relies fully on its community. Hope that the community will grow bigger thus making the engine better in the future.

<br />

Since I plan to work on my next game with Godot engine, I will be posting Godot-relative articles from time to time. See ya.