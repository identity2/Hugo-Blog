---
title: "Project: YARC - Cloning Reddit Using Go and Vue"
date: 2020-07-10T12:43:25+08:00
draft: false
---

I didn't get an internship this summer. This wasn't because of COVID-19 or failing interviews, I simply didn't apply to any. I felt that since I would be working something like 9-to-5 for the next 20, 30, or 40 years after I graduate, why would I spend my last summer vacation on...working? So, instead of going through the anxiety of internship searching, I designed a few side projects and started working on them. One of them is YARC, that is, the topic of this article.

<br />

YARC stands for Yet Another Reddit Clone. As its name implies, it is a [Reddit](https://www.reddit.com/) clone. You might wonder, what was the point of cloning an existing website. Well, first of all, after taking the [Software Engineering course](/cuhk-course-review/csci3100) last semester, I found that I really enjoyed building websites, so I wanted to challenge myself to go through the full design-to-deploy process. Secondly, although I wanted to build a website, I have no "innovative" "killer" "business" ideas, so I figured I should build the site I visited most (as you might have guessed), Reddit. Thirdly, most of my previous side projects were games and mobile apps, however, since I was planning on doing backend software engineering job after I graduate, I thought a complete web project on my resume would help.


# Design and Planning

I began the design by searching for the technologies to use. Since web development is a fast moving industry, there were countless frameworks and tools for me to choose from. The popular ones were Angular, Flutter, React, Vue for frontend, and Python (Django, Flask), Ruby (on Rails), PHP (Laravel), Java (Spring Boot), Go, C# (.net), JavaScript/Typescript (node) for backend. After some considerations, I finalized my tech stack to be:

* Frontend: Vue
* Backend: Go
* Database: PostgreSQL + Redis
* Container: Docker

## Why Vue?
I tried React on a Hackathon last year. I also tried Flutter on a [side project](/apnea-app) before. I disliked React because nesting HTML code in JavaScript is just too cursed to be true. Flutter, on the other hand, is pretty neat, but I thought it wasn't mature enough for serious web development. Thus, a natural move was to go with Vue. I bought a Udemy course on Vue and found that I quite liked the way Vue organizes its code. The division of `<template>`, `<script>`, and `<style>` in a document is a huge step out of React's mess, and the `data`, `props`, `watch`, `mounted`, `methods`, `computed`, etc properties in a Vue object just makes every thing clear and readable. So I stuck with Vue.

<br />

Unrelated Note: My hopes on the direction of web frontend industry are 1) Let TypeScript become a thing, 2) Let WebAssembly take over. (You might have noticed, the common goal of the two is - *Getting rid of the error-prone JavaScript development.*)

## Why Go?
So I was hanging out in this wonderful [Tenlong Bookstore](https://www.tenlong.com.tw/) in Taipei last summer, and found this lovely [book](https://www.amazon.com/Programming-Language-Addison-Wesley-Professional-Computing/dp/0134190440). I didn't know why I bought it in the first place (I never coded in Go then), but the book proved very useful to me. After reading couple chapters of the book, I found the beauty in Go, and really wanted to try and develop something using it. However, the main reason of choosing Go for this project was that it was the most prominent static-typed language for backend development aside from the older languages like Java and C#. In my opinion, static-typed languages are less error-prone, more readable, and thus they speed up the development process.

## Why PostgreSQL?
Most relational databases work pretty much the same except in minor details. I went with PostgreSQL because it was arguably the most popular relational database these couple years.

<br />

Why relational databases over NoSQL though? I argue that people should always stick to relational database as the main storage for their web app, only in very special cases should NoSQL come into the picture to *complement* the main relational database. Almost all data are relational, so relational databases simply model real world data better and more rigorously. It also makes it much simpler to perform complex updates and selects. All in all, I don't agree with the point of view that NoSQL "scales" better. To me, NoSQL is just a complementary tool for storing documents.

## Why Redis?
Redis was popular, so I was just testing the usage of Redis. The usage of Redis in this app is minimal. I would definite explore Redis more on future projects.

## Why Docker?
Why not? There wasn't really other choices. Like Vue, I also learned Docker through a Udemy course. I was blown away by how easy it was to develop, test, and deploy an app using images and containers. I hoped that I knew Docker back when I was developing my Software Engineering course project. A must-learn technology for all web developers (if not all software engineers).

<br />

# The Development Process

I spent around 2-3 months to develop YARC. There's really not much to say about the development process, since it was just coding for days, but I found it very rewarding to be able to apply the knowledge I learned last semester into practice. For example, I learned HTTP, DNS, TCP in my networking course, software testing in my Software Engineering course and complex SQL queries, schema normalization in my database course. Those concepts saved me tons of time when developing and deploying YARC.

<br />

I also gained a deeper understanding on some important topics in web development such as middleware chaining, the N+1 problem in database, CORS policy and preflight request in the browser, and the mechanism of JWT authorization.

# Deployment
Heroku offered a free tier for running an app along with free PostgreSQL and Redis attachments. Although the usage was very limiting (for example, it sleeps every 30 minutes of inactivity), I still went for it because I liked money and it was free. Also, it was extremely easy to deploy a Docker image on Heroku, so that was a natural choice.

<br />

I deployed my frontend app on Firebase because again, it was free. How it was better than Heroku was that it would not sleep every 30 minutes of inactivity. It was for static websites only of course, so I could not deploy my backend server here.

# Conclusion
I just finished developing and deploying a Reddit clone web app.

![Homepage](https://i.imgur.com/jvVG5yU.png)

# Project Link
[Link to YARC](https://yarc-29bed.firebaseapp.com/)

[Source Code on GitHub](https://github.com/YuChaoGithub/YARC)

[Demo Video](https://www.youtube.com/watch?v=BwcGhgvhw6k)