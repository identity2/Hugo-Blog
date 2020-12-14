---
title: "My First CTF Experience"
date: 2020-11-21T16:57:32+08:00
draft: false
---

Just participated in my very first Capture the Flag (CTF) competition two weeks ago. I had never heard of CTF before I took the cybersecurity course this semester, and it didn’t interest me at first so I didn’t register for it until a friend of mine invited me to join his team. It turned out to be a fabulous experience.

<br />

Usually, CTF competitions can be classified into two types, namely, the “attack and defense” match where two teams battle by  attacking and defending a server, and the “jeopardy” contest where multiple teams compete to solve tricky puzzles. The CTF I attended was held by [HKCert](https://www.hkcert.org/). It was in the form of the “jeopardy” contest. 

<br />

The puzzles were divided into Web Security, Reverse Engineering, Binary Exploit, Cryptography, Digital Forensics, and Miscellany. What we had to do was to follow the instructions of the problems and jeopardize/hack the systems to fish out the “flags”. The flags were usually in the forms of `hkcert20{SoMe_F1ag_str1ng}`, and you couldn’t believe how hyped I was whenever I dug out a single line of these strings from a complicated problem. It was like having a line of coke which pushed my sleep-deprived brain forward to solve the next problem.

<br />

Also worth mentioning, I quite liked the scoring method. The scores you got from a problem depended on the number of teams which solved the problem. For problems solved by only 1-3 teams, you earned up to 500 points. On the other hand, for problems solved by 30+ teams, you got only a 25 points reward. Thus, solving a difficult problem granted you more points than solving 10+ simple ones. Our team managed to solve around 5 difficult problems and most of the simple ones. This made us the 5th top team in the final ranking.

<br />

Honestly I was only aiming at entering the top 30 teams before the competition, but when the contest started, quite surprisingly, our team stayed as the top 3 teams for a very long time, and it fueled our ambitions in achieving more. As a team of 4 CTF first-timers, we were more than satisfied with our final rank.

## Valuable Skills for CTF

A variety of skills and tools are required to solve CTF problems. As far as I am concerned, I found that the knowledge I gained from my computer networks course mattered the most. All the in-depth knowledge in IP, TCP, HTTP, DNS helped me crack a great amount of problems. Furthermore, some understanding in OS, SQL, Web development, Docker, and Cryptography also proved handy in solving some tricky problems. However, my OS and Cryptography knowledge was too shallow so I couldn’t solve most of the Binary Exploit and Cryptography problems.

<br />

I also took a course in cybersecurity which covered some attacking techniques like SQL injection, XSS, CSRF, ROP Chain. It was good to know these methods, but they were usually too standard to provide practical uses on CTF problems. Most of the difficult CTF problems require you to have a more thorough knowledge in the fundamentals of the systems (i.e. OS, networks, web server, crypto system) so that you could tweak the standard attacking schemes into something that fits the problems.

<br />

As for the tools, a Linux (preferably Kali Linux) is a must. Most of the Digital Forensics problems require software which is easily available on Linux. Unfortunately, most of our team members had only macOS machines, so it was very troublesome to install some ad-hoc “hacker tools” like angr, aircrack-ng, password crackers, RAID disk tools, and memory dump analyzers. However, it happened that a member and I were taking a cloud computing course where we were granted three Debian virtual machines to run map-reduce programs. We turned out using the virtual machines extensively to solve various problems which required a Linux environment. So, great thanks to [CSCI4180 Introduction to Cloud Computing and Storage](/cuhk-course-review/csci4180), god bless you.


## Some Interesting Problems

Some problems really amazed me on how they were designed, and others cracked me up for how witty and memeable they were. I’ll list three such problems here.

#### Rickroll (Web Security)

They put down a URL in the problem description and that was it. And guess what, it [rickrolled](https://youtu.be/dQw4w9WgXcQ) the heck out of us.

<br />

The solution was to look for the `robots.txt` file to get the hidden URL. Then, the website located by the URL required us to enter a set of username and password. Most people were stuck in this step, including our team. Whenever you entered some random username and password sets, it would respond with a 500 internal server error. Most people were looking for the correct username and password set, but there was none. It turned out that this happened because the internal Apache server was misconfigured. By digging more information from the server, you would find that if you request the webpage with a gibberish HTTP method, you would get the flag.

#### Doom (Miscellany)

Given the Doom game files, the problem told us to "kill the boss the obtain the flag".

<br />

This problem was extremely tricky and required some divine instincts (as most problems classified in Miscellany). To solve it, I first booted up the game with a MS Dos emulator called dosbox. Then I searched on the web to check in which level was the boss located in. It turned out to be level E1M8, E2M8, E3M8, and E4M8. Since the game file given contained only levels in E1, I knew the problem was referring to the boss in level E1M8. It would take a long time to advance to the boss level (as I was bad in FPS games), so I searched for cheats online. I used sine cheat commands to warp to the boss level, gain invulnerability, and kill the bosses (it turned out to have two of them). However, when one of the bosses fell, the game crashed. I was stuck in here for literally more than three hours and finally realized that there must be something wrong with the data files of the game. Thus I did a quick search and found a software called Slade which was capable of opening and viewing Doom’s data file “DOOM1.WAD”. I scrolled through the game assets and BAM... a wild flag appeared in the frame images of the boss dying animation. The images were changed to the .png format instead of Doom’s usual image format which explained the crash.

#### Conversion Center (Web Security)

The problem stated that there was a flag stored in the `/gotenberg/flag` directory in the local file systems of a containerized Gotenberg (PDF conversion) web service.

<br />

We could not directly access the file through HTTP requests, so we checked out the APIs of Gotenberg to find if there was anything useful. After some reading, we found that one of the APIs of Gotenberg was able to receive a “remote” URL, convert it into PDF format, and send it back to the requesting user. Thus, we exploited this API by sending a request asking the service to convert the file located at the URL `file:///gotenberg/flag`. The server thought it was a remote URL so it fetched the file for us anyway, and gave the flag to us in *beautiful* PDF format.

#### 777 (Cryptography)

I don’t remember the details of this problem too much, but the main idea was that the crypto system was based on using timestamps as the random seed and taking a Hong Kong Identification number as a parameter to generate the “randomized” result of a slot machine.

<br />

To crack this slot machine, we wrote a short script to generate Hong Kong Identification numbers until we found a desired match for the slot machine (I forgot what was the condition of a “desired match”, but we deduced it from the source code of the problem). Then, when we started a stopwatch as soon as we entered the slot machine. Another short script we wrote aided us to calculate the exact time which, combining the HKID number, would generate **777** in the slot machine. Lastly, with our sweaty hands, we pressed ENTER as soon as the stopwatch reached the target timestamp (the timestamp was in seconds instead of the usual milliseconds timestamp, so we could do it by hands), and BOOM! Here goes the flag!

## Conclusion

[Great competition!](https://youtu.be/dQw4w9WgXcQ)

<span style="color: white">hkcert20{y0u_FoUnD_tH3_F1a9_cOnGr4Ts}</span>