---
title: "My Experience in Google Summer of Code 2017"
date: 2017-09-10T15:10:00+08:00
thumbnail: ""
static_page: false
draft: false
---
I've already posted an article about Google Summer of Code 2017. However, [the post](/posts/gsoc-2017-conclusion) is mainly about the project itself. For this article, I'd like to share my experience and thoughts for the whole GSoC period.

****

Google Summer of Code 2017 was an extremely exciting and rewarding experience for me. I was very lucky to be accepted by Systers (Anita Borg Institute) for working on the PowerUp-iOS project.

<br />

Before heading straight into the actual GSoC period, I would like to write briefly about why and how I applied for GSoC. From late 2015 to early 2017, I suffered from a severe illness (called Giant Cell Tumor of sacrum), which limited my ability to stand and even sit for over about 15 mins. The illness caused extreme pains in my thighs, feet, and spine from time to time, but what bothered me most is boredom -- I suspended my studies for already 1.5 years at that time, and I couldn't do anything except reading, coding and playing games. (Yes, it's bad for my eyes, but I used my laptop while I was leaning on the bed.) I was very depressed not because I was ill, but that I felt I was doing totally nothing meaningful for a long time. I then started browsing some "working from home" opportunities on the internet, hoping to have some work to occupy my time. I didn't find any remote working jobs that fit my novice skill sets, but fortunately, a post on Reddit reminds me of Google Summer of Code.

<br />

I've always wanted to participate in Google Summer of Code. In early 2015, I found it quite overwhelming because I was not confident in my programming skills and I had no open source experience before. This year, 2017, the thousands of projects and hundreds of organizations overwhelmed me again. I browsed all the projects I was interested in, but my skill sets were just so narrow to actually working on those projects.

<br />

I tried applying anyway. I first narrowed down the projects to those I was utterly enthusiastic about (to name a few, MuseScore, Mixxx, Tiled, PySoy, Terasology, and of course, PowerUp), then I evaluated which programming language, code-base and community was a best fit for me. I chose to apply for the PowerUp project at last because the code base was relatively small, it used the easy-to-learn Swift language, and it was a mobile game (I had some experience in mobile game development).

<br />

Though students could write at most 5 proposals for different projects, I considered I only had enough time and strength to write one polished and detailed proposal. I dived into the code base as well as participated in the community for Systers' PowerUp project right after I decided to apply for that. Though I had zero experience in Swift and iOS development, I figured out that I would be able to pick them up rather quickly since the community was extremely friendly and helpful and I was a fast learner myself. As a result, I worked and polished my proposal through couple of iterations (the community was so nice that they gave me some helpful feedbacks for my draft proposal), submitted it, and prayed.

<br />

I still remembered the time when the result was announced. It was 12:00 am in my time zone, and the GSoC webpage was so crowded that I couldn't get into the result page even after I refreshed the page for dozens of times. Suddenly, ha! I saw my name on Systers' Slack channel which congratulated me and other students for being accepted. My journey on Google Summer of Code then began.

<br />

The community bonding period came immediately. During this time, I read through tons of iOS development tutorials, worked hard to pick up the GitHub pull request workflow, and discussed a lot of details about the tasks and milestones of the project with the team. Since the project we're working on is called PowerUp (I won't get into details about the project since I already posted an [article](/posts/gsoc-2017-conclusion) about it.), our team is called the PowerUp team. The PowerUp team consisted of 10 members in 5 different timezones, four of them are from India, three of them are from the United States, one of them is from Switzerland, one of them is from China, and I am from Taiwan. On top of that, technically, the team was split into 3 smaller sectors, the iOS sector, Android sector, and UI/UX sector. I wam in the iOS sector, but all three of them worked extremely close to each other.

<br />

When GSoC actually started, we have meetings held every week which all of our team members would attend. Every member should share what they've done through the week, what they planned to do the next week, and what difficulties did they face. At first, it was quite difficult to me to be engaged in the meeting, since it was the very first time for me to join a pure English speaking team. However, through practicing and attending the meetings every week, not only my verbal English was significantly improved but also I got more confident in communicating with a team in English.

<br />

Aside from English, I got a great improvement in another language as well. That is, the Swift programming language. I learned Swift from zero to hero (well, at least intermediate skills) by getting my hands dirty in an actual Swift project (PowerUp). My mentors also helped me out a lot when I was stuck and discussed different ways to approach the same results with me. The GitHub pull request workflow was another valuable knowledge I learned. I recalled that in the beginning, I didn't know that further commits and pushes would affect the branches' head in pull requests. Trying to solve a conflict, I accidentally executed a notorious "git --force push" command, and boom! My very first pull request was ruined. Fortunately, this mistake didn't happen again in GSoC17. (And hopefully, it wouldn't occur again in my lifetime.)

<br />

Furthermore, I gained some precious experiences about remote collaborating mobile app development. Since PowerUp was planned to deployed in both Android and iOS platforms, it was a great challenge to make the iOS version in sync with the Android version, not to mention we were developing the both versions remotely. To overcome this obstacle, we wrote and shared pseudo-code of the features we planned to develop on our Slack channel before implementation, and we did demos of the iOS and Android versions of PowerUp on our weekly meetings to double check whether the features were similar. I think we really did a great job on synchronizing the iOS and Android version, since both versions now looks quite alike.

<br />

In conclusion, I really enjoyed Google Summer of Code, I not only improved my coding skills but also met a lot of extremely motivated and amazing people. In addition, though the tasks were quite challenging, I still stroke a nice balance between work and life. I always worked about 35 hours a week, and still got plenty of time playing games, reading books, and developing my own games as side projects. (By the way, I also recovered a lot from my illness through summer. Probably, GSoC is the best medicine for me :P)