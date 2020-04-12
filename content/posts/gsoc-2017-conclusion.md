---
title: "GSoC 2017 Conclusion"
date: 2017-09-04T11:37:00+08:00
thumbnail: ""
static_page: false
draft: false
---
(This is an overview and conclusion for my summer internship (Google Summer of Code 2017) in Systers on the PowerUp-iOS project. The original article is posted on systers' Blogger. Here is the [Link](https://systers-opensource.blogspot.tw/2017/08/yu-chao-powerup-ios-final-report-gsoc.html).)

## Overview

PowerUp is an educational mobile game app aiming at providing adolescent girls with reproductive health knowledge, empowering them with better self esteem, and teaching them conflict resolution skills in social life.

<br />

It is a choose-your-own-adventure game which the players have to navigate an avatar to engage in conversations of different scenarios.

#### Platform
Currently, there are both iOS and Android version of PowerUp. I worked on the iOS version through GSoC 2017.

#### Language & Frameworks
* Swift 3.0
* UIKit - Used for most scenes of the project.
* SpriteKit - Used for the mini games of the project.

## Accomplishments
I worked on three main tasks through GSoC: code refactoring, mini game implementation, and applying new UI elements.

#### Code Refactoring

Before GSoC 2017, the code base of PowerUp was a little unorganized. Not only model code was mixed with controller code but also their were plenty redundant view controllers in the Storyboard which could be cut and merged into one.

<br />

I wrote a singleton class to wrap database operations, created some data model classes to wrap the database entries, and most importantly, moved model code (database querying code) out of the controllers.

<br />

On top of that, I reorganized the Storyboard by merging some hard-coded view controllers. The number of view controllers is reduced from over 20 to below 10.

<br />

I believe that after the code refactoring, PowerUp will be more friendly and less intimidating for future developers.

#### Mini Game Implementation

One way to make a choose-your-own-adventure-game more interactive and fun is to incorporate it with some mini games. I implemented 3 mini games throughout GSoC 2017.

###### Minesweeper Game
The first one is Minesweeper Game. It aims at helping players to learn the success rate as well as the pros & cons of different contraceptive methods.

The game works like an ordinary Minesweeper game, however, it doesn't give the player information about "bombs", making it a game of pure chance. We designed Minesweeper as a game of pure chance because we would like to simulate the success rates of contraceptive methods. Here is an example to make the idea clearer: When the game presents condom as its current contraceptive method, 2 bombs will be located randomly in the 25 grids because the contraceptive success rate of a condom is around 90% ≈  (23/25), and 25 (total grid count) - 23 ("success" grid count) = 2 ("bombs").

###### Vocab Matching Game
This game teaches players reproductive health-related vocabulary. We suggest that before learning the actual knowledge about reproductive health, the players should first grasp the meaning of related vocabulary.

<br />

The game consists of tiles and clipboards. When the game starts, random tiles with icons on them will  be spawned on the left of the screen. They move to the right side of the screen over time, and the players have to drag and swap the clipboards on the right so that the text on the clipboard matches the icon of the tile in the same lane.

###### Sink to Swim Game
The last mini game, Sink to Swim, is a "myth buster"-like game with the objective to "bust" sex-related myths feed by peers or public media.

<br />

It resembles trivia quiz games where a statement will be presented, and the players have to click on the "true" or "false" button to determine whether it is a true statement or a myth. To make the gameplay more exciting, we added a boat figure with an avatar sailing on it. The boat will sink over time, and the only way to save the avatar from drowning is to answer the correct answer, which raises the boat for a certain altitude.

#### Applying New UI Elements

In GSoC 2017, we had a UI/UX designer team dedicated to redesign UI elements and create new art assets for PowerUp. The GSoC student in the designer team (Kim) submitted pull requests on GitHub which contained her artworks. My job was to check those pull requests weekly, and applied them to PowerUp-iOS.

<br />

Thanks to the designer team, new UI elements and graphic assets for PowerUp are more minimalist, sleek, and modern. I believe that they really defined a great art style for the project which adolescent girls will truly enjoy.

## Challenges

I faced many challenges through GSoC 17 because almost all of the technologies and workflows were new to me.

#### Technologies

###### iOS & Swift

Before GSoC 17, I was entirely new to native iOS app developing and Swift, not to mention the UIKit and SpriteKit frameworks. Fortunately, since I came from a C# and C++ background, after reading the official tutorial of Swift 3.0, I became confident to code in Swift.

###### Unit Testing & Continuous Integration

Before GSoC 17, I barely knew the meaning of "unit testing" or "continuous integration", so when I saw those terms in the requirements, I was a little overwhelmed. I did plenty of searches through Stackoverflow and Google, read some articles on Ray Wenderlich, and inquired my mentors. I finally understood the technologies better after researching and asking questions for a week. Now I have integrated PowerUp-iOS with Travis CI and wrote plenty of unit tests.

#### Workflows
I did not really know the mechanics of GitHub before GSoC 17. For the community bonding period, I spent most of my time trying out GitHub and asking questions about the pull request workflow. I remember that I accidentally deleted a pending PR branch I submitted in community bonding period when I was trying out "push --force". It is good that I figured out the workflow before GSoC coding period actually started, or I may misuse the infamous "--force" again and delete all of my hard work.

## Takeaways
I really learned a great deal throughout GSoC 17. As I mentioned above, I learned iOS & Swift development, unit testing with Xcode, continuous integration, and the pull request workflow of GitHub.

<br />

Aside from technical knowledge, I learned some remote collaboration skills, demo & presentation skills, as well as some product management skills.

<br />

Also, this was actually the first time for me to work in a full English-speaking team. I could not deny that it was a little intimidating in the beginning, but after couple of weekly Hangout meetings, I became more and more confident about my verbal English and communication skills.

## Overall Experience
Google Summer of Code is an entirely new and exciting experience for me. I really like the culture of open source community, which everyone is extremely motivated, enjoying their works, and happy with all of the team members. I also really enjoy the "working at home" life style, which I can manage my time freely and have a nice work-life balance.

<br />

A big thanks to my mentors (Ginny, Jennifer, Sally), admin (May), and all the team members of PowerUp! I think we all brought the project to an entirely new level, and it is a real pleasure to work with you all!