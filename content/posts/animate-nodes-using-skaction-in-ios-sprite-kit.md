---
title: "Animate Nodes Using SKAction in iOS Sprite Kit"
date: 2017-08-06T22:35:00+08:00
thumbnail: ""
static_page: false
draft: false
---
Apple's Sprite Kit is a really well-designed and convenient framework for iOS game development. In this article, I will briefly introduce **Sprite Kit Action** (`SKAction` in short), which is the bread and butter for animating nodes in Sprite Kit.

## The Basics
In Sprite Kit, every node can run an `SKAction` by calling the `run(_:)` function. `run(_:)` takes an `SKAction` as its parameter, and will perform the action immediately after the call. Below is a simple examples of running `SKAction`s:

{{< highlight swift "linenos=table" >}}
let moveAction = SKAction.move(to: CGPoint(x: 10.0, y: 20.0), duration: 5.0)

spriteNode.run(moveAction)
{{< / highlight >}}

The code above moves (aka. translates) `spriteNode` to (x: 10, y: 20) in 5 seconds.

<br />

Sprite Kit also provides a variety of `SKAction`s of the same type. For instance, aside from `SKAction.move(to:duration:)`, there is also a `move(by:duration:)` function, which you can specify the amount of movement instead of the exact destination position of the movement.

<br />

On top of `move` action, `rotate` and `scale` are also frequently used actions which animate the transform of nodes.

## Completion Closure
When performing animations, it is quite often that we want to do some other stuff when the animation ends. For example, after scaling up a sprite, we may want it to change color.

<br />

`SKAction` fulfills this need by providing another `run(_:completion:)` function. It receives an additional `() -> Void` typed closure named `completion` as its parameter. The `completion` closure will be run right after the action is completed. Below is an example.

{{< highlight swift "linenos=table" >}}
let scaleAction = SKAction.scale(to: 2.0, duration: 3.0)
spriteNode.run(scaleAction, completion: { spriteNode.color = SKColor.red })
{{< / highlight >}}

This code scales up `spriteNode` by 3 over 3 seconds, then changes its color to red right after that. You can also pass the closure in a more structured way:

{{< highlight swift "linenos=table" >}}
let scaleAction = SKAction.scale(to: 2.0, duration: 3.0)
spriteNode.run(scaleAction) {
    spriteNode.color = SKColor.red
}
{{< / highlight >}}


## Stop an Action
In almost all games, some animations will have to stop before completion. For example, when a monster is killed, we should definitely stop its movement and play its dying animation at the exact position which it was killed.

<br />

Sprite Kit uses **key**s to attain this functionality. We can assign a **key** for any `SKAction`s by

{{< highlight swift "linenos=table" >}}
let actionWithKey = SKAction.scale(by: 2.0, duration: 2.0, withKey: "my_key")
{{< / highlight >}}

For every `SKAction`, there is a `SKAction.action(by:duration:withKey:)`-like function so that you can assign a `String` typed key to it.

<br />

Back to the topic, if you want to stop an action while it is still running, you can simply call `removeAction(forKey:)`. Below is a brief example.

{{< highlight swift "linenos=table" >}}
func spawnMonsterAndMove() {
    // ...

    // Move the monster by the move action.
    let moveMonster = SKAction.move(to: CGPoint(x: 100.0, y: 100.0), duration: 10.0, withKey: "move_monster")
    monsterNode.run(moveMonster)
}

// Being called when the monster is shot.
func monsterDied() {
    // Stops the move action of monster node.
    removeAction(forKey: "move_monster")

    // ...
}
{{< / highlight >}}

## Sequence, Group, Wait
There are also times that you want to perform multiple animations sequentially or perform a group of animations at the same time.

#### Sequence
There is a **sequence** action in Sprite Kit which takes an array of `SKAction`s as its parameter. When running a **sequence** action, it runs the separate actions one by one. Below is an example.

{{< highlight swift "linenos=table" >}}
let moveAction = SKAction.move(to: CGPoint(10.0, 20.0), duration: 10.0)
let scaleAction = SKAction.scale(by: 2.0, duration: 1.0)

// Move the sprite, then scale it by 2.
let moveThenScaleAction = SKAction.sequence([moveAction, scaleAction])
spriteNode.run(moveThenScaleAction)
{{< / highlight >}}


#### Wait
Now you can run a sequence of actions quite easily, however, usually, we will want a small pause between the consecutive actions. `SKAction.wait(forDuration:)` is what you need here. By adding a **wait** action in the middle of the action array, a small pause then appears in between the animation:

{{< highlight swift "linenos=table" >}}
let moveAction = SKAction.move(to: CGPoint(10.0, 20.0), duration: 10.0)
let waitAction = SKAction.wait(forDuration: 1.0)
let scaleAction = SKAction.scale(by: 2.0, duration: 1.0)

// Move the sprite, pause for 1 sec, then scale it by 2.
let moveThenScaleAction = SKAction.sequence([moveAction, waitAction, scaleAction])
spriteNode.run(moveThenScaleAction)
{{< / highlight >}}


#### Closure as an action
Other times, instead of pausing, we want to run some other code in between of the sequence. There is an `SKAction.run(_:)` action which takes a `() -> Void` typed closure as its parameter. The closure will be called when the action is run. For example, if we want to change the color of `spriteNode` in between the move and scale action, we can do this:

{{< highlight swift "linenos=table" >}}
let moveAction = SKAction.move(to: CGPoint(10.0, 20.0), duration: 10.0)
let changeColor = SKAction.run({ spriteNode.color = SKColor.red })
let scaleAction = SKAction.scale(by: 2.0, duration: 1.0)

// Move the sprite, change its color to red, then scale it by 2.
let moveThenScaleAction = SKAction.sequence([moveAction, changeColor, scaleAction])
spriteNode.run(moveThenScaleAction)
{{< / highlight >}}


#### Group
Group action is similar to sequence action, it takes an array of `SKAction`s as its parameter. However, instead of running the actions one by one, it runs all the actions at the same time. By changing the previous example from `SKAction.sequence(_:)` to `SKAction.group(_:)`, the sprite will start scaling and moving at the same time.

## Repeating
Repeating an action multiple times is easy in Sprite Kit. There are 2 types of `SKAction`s which we use from time to time to repeat actions.

<br />

Firstly, if you want to repeat an action infinitely, you should use `SKAction.repeatForever(_:)`. The below code moves `spriteNode` back and forth forever.

{{< highlight swift "linenos=table" >}}
let moveForth = SKAction.move(to: CGPoint(x: 100.0, y: 100.0), duration: 10.0)
let moveBack = SKAction.move(to: CGPoint(x: 0.0, y: 0.0), duration: 10.0)

let moveBackAndForth = SKAction.sequence([moveForth, moveBack])
let repeatMovement = SKAction.repeatForever(moveBackAndForth)

spriteNode.run(repeatMovement)
{{< / highlight >}}

Otherwise, if you want to repeat the action for  only a finite number of times, use `SKAction.repeat(_:count:)` instead.

{{< highlight swift "linenos=table" >}}
let moveForth = SKAction.move(to: CGPoint(x: 100.0, y: 100.0), duration: 10.0)
let moveBack = SKAction.move(to: CGPoint(x: 0.0, y: 0.0), duration: 10.0)

let moveBackAndForth = SKAction.sequence([moveForth, moveBack])
let repeatMovement = SKAction.repeatForever(moveBackAndForth, count: 2)

spriteNode.run(repeatMovement)
{{< / highlight >}}

The code above will move `spriteNode` back and forth only 2 times.

## Conclusion
From June until now, I have programmed 3 mini games for my Google Summer of Code 2017 project [PowerUp-iOS](https://github.com/systers/powerup-iOS). In all three of the games, I used `SKAction`s intensively for animation code. Compared to **Coroutine** in Unity, I think Sprite Kit Action provides a more elegant and simpler way to code animations. Hope you can also appreciate the beauty of Sprite Kit Action. :D