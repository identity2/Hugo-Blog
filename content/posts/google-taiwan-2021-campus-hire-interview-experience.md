---
title: "Google Taiwan 2021 Campus Hire Interview Experience"
date: 2021-11-11T11:11:11+08:00
thumbnail: ""
static_page: false
draft: false
---

I was hunting for a new grad software engineering role over the last few months and quite fortunately, Google invited me for a technical phone interview one week after I submitted my resume through their job portal. I will write down the full process of my application in this article. Verbosely.

<br />

My application process, ordered chronologically:
1. Technical Phone Interview x 1
2. Virtual On-site Interviews (Technical x 4 + Behavioral x 1)
3. Team-matching Fit Talks x 3 (Matched with one of the team)
4. Hiring Committee Review
5. Additional Technical Interviews x 2 (Requested by the Hiring Committee)
6. Hiring Committee Re-evaluation
7. Onboarding

## Technical Phone Interview
I was called by a Googler from the Taipei Office for my technical phone interview. I got terrible insomnia the day before, so I was quite drowsy before the interview. Luckily my adrenal glands pumped just enough chemicals into my blood streams to pull me through the 45-minute interview.

<br />

The interview was conducted on Google Meet with the new Google Interview platform. It was just a shared real-time code editor with minimal syntax highlighting and formatting. Still, it was way better than the plain old Google Doc where you couldn’t even fit your function definition in a single line. There were no behavioral questions nor self-introduction in this interview, the interviewer threw me an easy question right away. I was caught off guard when the interviewer spoke Mandarin instead of English as I practiced all my interviews in English. Nevertheless, I quickly adapted and started explaining my thought process on the first problem. I encountered this exact same problem during my data structures course, so I went through it quite smoothly.

<br />

The interviewer quickly walked through my code and posted the second question. It was a medium-ish question. I walked through a couple test cases to gain some intuition, and quickly came up with an algorithm. As I was explaining my thought process, the interviewer cut me short and told me to head directly into coding. I wasn’t 100% sure about my approach, but started coding it anyway. It turned out that my solution couldn’t pass some test cases and the interviewer asked me to come up with such test cases. I walked through my code again, walked through the examples given, and couldn’t see what was wrong. I started to panic a bit and the interviewer probably noticed because he quickly posted the failed test cases on the editor. I immediately knew what went wrong and did a quick and hacky fix in my code. I wasn’t content with my code because the conditional branches were everywhere, undermining the readability greatly. I spoke my concerns with the interviewer, and he admitted that there was a better way to code this. Nonetheless, he said the time was up and since my solution passed all test cases it was ok. Afterwards, I asked a couple questions, and he was kind enough to share a whole lot more with me. He also gave me some genuine career advice and I felt so grateful that I got this opportunity to chat with him.

<br />

Later on I found out that the problem could be solved elegantly using O(N) space. I somehow came up with a hacky O(1) space solution which would very likely be the follow-up if I were to solve it using O(N) space at first.

<br />

I thought my journey ended here because I didn’t perform that well, but after an office day, I received an email informing that I cleared the round.

## HR Chat
The recruiter scheduled a meeting with me to talk about the remaining process and gave me the feedback from the previous interviewer. I was quite astonished that the recruiter said I got very positive feedback. But soon the stress came building up when I heard there would be four more technical interviews and one behavioral “Googleyness” interview.

## On-site Interview
The interviews were scheduled two weeks after the phone screen. They called these “Virtual On-sites” because originally these were done face-to-face in their offices. Before the pandemic, on-site interviews were done back-to-back with a lunch break, but for virtual on-sites, they were split into two days.

### Day 1
#### First Interview
My first interviewer was a Googler from the Shanghai Office. The interview was conducted in English.

<br />

After a brief mutual self-introduction, he posted a problem. I spent quite some time understanding what he was asking, as the description wasn’t really clear. The problem didn’t seem difficult at first glance, but after I described my solution, the interviewer told me my understanding of the problem still wasn’t correct. He provided me with more examples, and I finally got what the problem was about.

<br />

Fifty minutes had passed, so I quickly came up with an O(log N) solution. As I finished explaining my algorithm, I received the infamous “could you do better?” response from the interviewer. I wasn’t confident that I could, but I started searching for an O(1) solution in my mind anyway. After some hand-wavy remarks, I finally came up with an O(1) solution. Only 10 minutes were left, so he told me to quickly code it. I finished the code just in time, and analyzed the time and space complexity.

<br />

The interviewer said it looked good and “good luck”, but judging from his facial expression (i.e. a not-so-genuine grin), I thought I must’ve done something wrong.

<br />

Later on I found the exact same problem on LeetCode. It was a Hard. They tweaked the problem a little such that the input data were online streams instead of in-memory. Thinking back, I also realized a terrible bug in my code which the interviewer didn’t point out. Too bad I didn’t have enough time or else I could easily iterate on my solution. I felt my verbal description of the algorithm was correct though.

<br />

Unlike the phone screen, the interviewer in this round was quiet and didn’t speak much, so I was on my own most of the time. This didn’t feel good, as a lot of time could be saved if he just pointed out my misunderstandings directly when I went through my thought process at the beginning.

#### Second Interview
The interviewer was a Googler from the Shanghai Office. The interview was conducted in English. Unlike the previous rounds, he didn’t turn on his webcam, so what I saw was only his avatar pic of a Pikachu wearing a Team Rocket hat. Nice.

<br />

He posted the problem on the code editor, and I felt an unbearable dread as soon as I recognized it as a text processing problem. I hated those. Panicking, I described a dynamic programming approach. The interviewer spent some time understanding my approach, and said that I was over-complicating it. He told me it was okay to stop speaking and ponder on the problem quietly for a while. I really doubted this remark. Fortunately, just as he finished talking, I came up with an O(N) time, O(1) space solution which required some discrete math. I wasn’t thinking straight and memorized a formula wrong, but the interviewer noticed this and quickly corrected me. After that, I started coding my solution. It took a while for me to handle some edge cases as text processing problems reek of ugly corner cases. When I finally passed all the test cases, 30 minutes had passed. The interviewer said though he prepared two problems, the time wasn’t enough for another one, so he spent the remaining time chatting with me. He also showed me the second problem, but he said it wouldn’t count towards the interview score. I forgot the problem right away.

<br />

He switched to Mandarin when he started chatting with me and said he was quite impressed by my past experiences and projects. I was glad that he actually dug through my GitHub repositories and viewed my projects. He said he liked them and couldn’t imagine the self-discipline it took to complete such projects. Looking back, I couldn’t imagine either. He thought it was nervousness that made me spend too much time on the question, but deep down I knew I couldn’t do it faster if I weren’t nervous. I simply sucked at tricky text processing problems. The end.

### Day 2
#### First interview
The interviewer was a Googler from the Mountain View Office but settled back in the Beijing Office because of the pandemic. He spoke Mandarin during the interview.

<br />

His first remark was “do you know algorithms?” I was entirely dumbfounded. I was right in the middle of a Google interview and he asked whether I "know algorithms"?

<br />

I replied yes and he said “let’s do an easy one.” It was indeed an easy one, a text-book algorithm problem. I explained and coded my solution within 5 minutes. The follow-up was a small tweak of the original problem. I quickly recognized this as a typical LeetCode hard problem which required DFS along with a memoization table. Explained and solved it in under 10 minutes.

<br />

The interviewer asked me if I was in a competitive programming team before. I said no, and felt quite embarrassed because I knew my algorithm skills would never get on par with the competitive programming teams in my university even if I spend the rest of my life grinding problems. I started too late and didn't have that big of a brain.

<br />

He said since there was still plenty of time, why not solve another one. Honestly I didn’t want to, but ok, here we went. It was a hard problem with a hint of geometry. I didn’t like it because it was very tough to visualize geometry problems on a text editor, and it was even more difficult to explain my solution by drawing triangles and the xy-axis using pure text like this:

<br />

```
|   ^
|  /  \
| /    \
+- - - - - - -
```

<br />

It took me quite some time to understand the problem itself, and I spent great efforts to explain my solution to the interviewer. I didn’t know whether he understood my solution or not but he said I could start coding. He said I could use pseudo code since he already got what he was looking for in the previous problems. I worked on my code and didn’t have enough time to finish because I got a little stuck when implementing the pushing and popping of geometrical structures in and out of a stack. Without visual aids, it was difficult as hell. I kind of missed whiteboarding, at least I could draw.

<br />

We chatted a bit towards the end, where I asked about his background and the team he was working in.

#### Second Interview
The interviewer didn’t introduce himself so I don’t know where he was located. He spoke Mandarin at first, but switched to English after inquiring my preference (I said I could do either).

<br />

He gave a brief introduction to the problem, telling me that it was not a typical algorithmic one. He said it was okay to use some data structures or algorithms, but no fancy ones were needed. He also told me not to complicate myself with finding the optimal solution, since the nature of the problem was to iterate towards the optimal algorithm.

<br />

I quickly came up with a naive solution and coded it. Analyzed the drawbacks and trade-offs before heading into the next iteration. The solution was also quite straightforward to implement. I got stuck, however, during the third iteration. Thinking back, I made the mistake of trying to get to the optimal solution, which the interviewer explicitly told me not to do. Watching me struggle, the interviewer gave me a small hint and told me to start over again. I discarded the mess I coded and quickly finished what the interviewer was asking for.

<br />

Time was up and the interviewer said I was very close to the optimal solution. I didn’t know whether this was a positive or a negative remark.

#### Third Interview
This was a behavioral round. The interviewer was a Googler from the Taipei Office. It was conducted in Mandarin.

<br />

I did a quick self-introduction and the interviewer started asking me some typical LP questions afterwards. Generally, I wrapped all my personal experiences and stories into STAR-ish format and the interview went smoothly. Still, I felt that my verbal storytelling skills were quite lacking even when speaking in my native language.

<br />

After I answered all the questions, the interviewer went through my responses over again to double check that the transcript was accurate. He later explained to me that the hiring committee would only see his written report because the interview was not recorded. Thus, I believe what mattered more was the content of my answers rather than my delivering skills.

## HR Chat
A week after my on-site interviews, the HR called and said that my performance was "generally positive", but not enough to clear the hiring committee alone. Thus, he planned on matching me with a team first, so that my package could be submitted to the hiring committee along with a Statement of Support from the team's hiring manager. This would increase my chance in passing the hiring committee.

## Team-matching Fit Talks
### First Fit Talk
I interviewed with a hiring manager right after the HR chat. He asked many behavioral questions through out the fit talk. I expressed interest in his team, but unfortunately he couldn't sponsor my package due to unknown reasons.

### Second Fit Talk
Couple of weeks had passed before I had my second fit talk. It was very chill. The hiring manager spent around 20 minutes showing what his team was working on and only asked me a couple simple questions. Unfortunately, there must be some misunderstandings between him and the recruiter because no headcount of my level was actually available in the team.

### Third Fit Talk
A month had passed without getting any more fit talks scheduled. I thought it was the end for me, so I started interviewing with other companies. After I got an offer from another company, I emailed my recruiter about it and they arranged another fit talk for me. It was similar to the first fit talk I had. Lots of behavioral questions. The hiring manager also asked me some high level technical questions such as testing, documentation, attitude on learning new technologies, etc. I thought it went well and the team actually matched my skill sets. After a couple days, I finally got my Statement of Support from the team's manager.

## Hiring Committee Review
My package along with the Statement of Support from the team's manager was submitted to the hiring committee for review. My hopes weren't high since I knew I didn't do well in my on-site interviews.

<br />

I was deciding whether or not to go with an offer from a local start-up when I received two more interview invitations from Google. The recruiter said the hiring committee needed more signals to make a hiring decision, so I had to attend two more technical interviews.

<br />

I hadn't grinded LeetCode since my on-site interviews two months ago and I needed to do two more technical interviews. Great.

<br />

I had one week to prepare, so I grinded LeetCode from day to night that whole week. It turned out that I didn't forget anything. I got even better at algorithms this time as I finally solved all four questions on LeetCode's weekly contest the weekend before my interview.

## Additional Interviews

### First Interview
The interviewer was a Googler from the Taipei office. It was conducted in Mandarin.

<br />

We headed directly into the problem without introducing ourselves. I knew immediately how to solve the problem once I heard the problem description. After explaining and analyzing my solution, I coded it within 20 minutes.

<br />

For the follow-up question, I came up with an exponential (brute-force) solution, and analyzed the trade-offs between a more space-efficient and a more time-efficient approach. During the break of the interview, I realized that the problem could be solved in polynomial time using a textbook algorithm, but it was too late. Nonetheless, I think I did pretty well in this round.

### Second Interview
The interviewer was a Googler from the Taipei office. It was conducted in Mandarin.

<br />

We both introduced ourselves during the beginning of the interview.

<br />

He gave me a warm up easy problem at first, which I solved in no time. Then, he increased the difficulty by releasing some limitations of the problem, making it more general. Luckily, a solution formed in my mind right away after I heard the new problem description. I discussed my solution with the interviewer and analyzed the complexity before the interviewer allowed me to write the code.

<br />

I completed the code within 25 minutes, but I wasn't sure my code was bug-free. Thus, I ran through a few test cases to double-check the correctness. It turned out to be all right, so I told my interviewer that I thought my code was ok. He agreed, and moved on to the follow-ups.

<br />

The follow-up problem was an even more general version of the original problem. I came up, again, with the brute-force solution and analyzed the complexity. The interviewer seemed content as he ended the interview there and allowed me to ask him questions.

<br />

I asked questions regarding his team as well as how Google handles covid at Taipei.

## HR Chat
The recruiter called me a couple hours after the interviews, telling me that the feedbacks were positive and that my chances of passing the hiring committee were high. Still, they told me to play safe and not reject my other offers.

## Back to Hiring Committee
After two days, the recruiter emailed me, informing that I cleared the hiring committee.

<br />

Another call was scheduled to discuss the details of my offer package.

## Onboarding
There was an onboarding dashboard listing all the tasks to be completed, so this process was rather straightforward. An onboarding wiki and community forum were also given so it was easy to look stuff up or ask questions about the onboarding process.

## Post Script
I dreamed of getting into Google during the first couple years of university, but then realized my chances were pretty low as the competition was extremely cutthroat. LeetCoding is now an arm race across computer science students around the world and it burns people out. It is difficult to handle all the negativity and toxicity out there on CS-career-related internet forums (*cough cough * Bli...nd, *cough cough * r/cscar...eer...questions), it may be even tougher to take in the positivity of successful people.

<br />

As I've gone through the entire Google hiring process now, I firmly believe that "luck" is an important factor of whether a skilled candidate succeed. Yes, you can grind 1000+ LeetCode problems and develop amazing side-projects to gild your resume, but there is simply way too much randomness in the process. The recruiter happens to overlook your amazing resume. The interviewer decides to ask you a tricky hard problem involving Fenwick Tree or other niche data structures. The team that matches your skill sets happens to not have any headcounts for your level. You happen to graduate in 2020 during Google's hiring freeze. So on and so forth.

<br />

Hope this article helps.

## A note to current CUHK CS students
I'm greatly indebted to CUHK for taking me this far. My years in Hong Kong had been fruitful and eye-opening. Thus, I feel extraordinarily sad for the current political situation in Hong Kong. It was a tough decade for all Hong Kong residents and even more so for university students. I'm sorry that I can do little about it, but I'm very willing to help if you're a CUHK CSE student looking for job opportunities in Google Taiwan. If you're interested, send me an email and we can chat.