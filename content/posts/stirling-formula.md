---
title: "Stirling's Formula - Approximation of n!"
date: 2017-10-30T20:00:00+08:00
thumbnail: ""
static_page: false
draft: false
---
# I.Introduction: The Coin Tossing Problem

Whenever you have difficulty deciding something, for example, whether to attend the lectures of a course or not, the most common thing to do in this scenario is to toss a coin and see whether the heads or tails of the coin is facing up when they land. Assume that the coin you toss is uniform, meaning that the chance of the heads to land facing up is equal to the chance of the tails to land facing up. Then, the chance that you attend the lecture would be $\frac{1}{2}$. You could further explain that, if you always decide whether or not to attend a lecture by tossing a coin, you would probably end up attending about half of the lectures at the end of the semester (which is a relatively high attendance rate compared to somebody).

<br />

But then, what is the chance that you attend exactly half of the lectures in a semester. Mathematically put, if you have $2n$ lectures in total, what is the chance that you attend exactly $n$ lectures? There will be $2^{2n}$ possible outcomes in total if you toss the coin $2n$ times, and the possible outcomes that there are $n$ in $2n$ times when the coin faces up (you attend the lecture) will certainly be ${2n \choose n}$. Thus, the possibility that you attend exactly half of the lectures will be $$\begin{equation}P_{2n} = \frac{2n \choose n}{2^{2n}}=\frac{(2n)!}{2^{2n}n!n!}\label{ref1}\end{equation}$$

<br />

And when years and decades have passed, when $n\rightarrow\infty$ (assume that you would study in a university for the rest of your life), then, what would $P_{2n}$ in $\eqref{ref1}$ be? The problem immediately emerged is that how should we tackle the ugly $n!$ and $(2n)!$ ? A sensible way to deal with this is to approximate $n!$ with other terms, and this is when the powerful Stirling's formula shall be introduced.

<br />

# II.The Proof: Stirling's Formula

Before getting our hands dirty into mathematical statements and equations, let us first take a glimpse and see how the formula looks like $$\begin{equation}\lim\_{n\to\infty}\frac{n!}{\sqrt{2\pi}\cdot n^{n+\frac{1}{2}}\cdot e^{-n}}=1\label{ref2}\end{equation}$$

<br />

Quite intimidating, isn't it? All the famous irrational numbers such as $\sqrt{2}$, $\pi$, and $e$ play a part in it. But if you've studied hard enough in your calculus course (at least attend more than half of the calculus lectures), the proof of this formula will be just a piece of cake for you. Don't believe me? Let me give a proof of that!

<br />

It is quite obvious from the formula that if we take the natural log on both sides, it will be easier to handle, since many of the terms include exponents and there is an $e$ being the base number in one of the terms as well. So, taking $ln$ on both sides, and we'll have $$\lim\_{n\to\infty}ln\frac{n!}{\sqrt{2\pi}\cdot n^{n+\frac{1}{2}}\cdot e^{-n}}=ln\, 1$$

<br />

After arranging it properly using techniques of logarithm, we will further get $$\begin{equation}\lim\_{n\to\infty}(ln\, n!-\frac{1}{2}ln\, 2-\frac{1}{2}ln\, \pi- n\, ln\, n- \frac{1}{2}ln\, n+n)=0\label{ref3}\end{equation}$$

<br />

This should seem less intimidating. Our mission now becomes approximating the term $ln\, n!$ using $-\frac{1}{2}ln\, 2-\frac{1}{2}ln\,\pi-n\, ln\, n- \frac{1}{2}ln\, n + n$. We'll start by showing that $$\begin{equation}ln\, n!=\sum\_{k=1}^{n-1}\int\_{k-\frac{1}{2}}^{k+\frac{1}{2}}(ln\, k)dt + \int\_{n-\frac{1}{2}}^{n}(ln\, n)dt+\frac{1}{2}ln\, n\label{ref4}\end{equation}$$

<br />

By calculating the integrations in the RHS, we'll get

<br />

$$\begin{align}
RHS & = \int\_{1-\frac{1}{2}}^{1+\frac{1}{2}}(ln\, 1)dt+\int\_{2-\frac{1}{2}}^{2+\frac{1}{2}}(ln\, 2)dt+ \dotsb +\int\_{n-1-\frac{1}{2}}^{n-1+\frac{1}{2}}(ln(n-1))dt+\int\_{n-\frac{1}{2}}^{n}(ln\, n)dt+\frac{1}{2}ln\, n \newline
& = (ln\, 1)+(ln\, 2)+\dotsb +[ln(n-1)]+\int\_{n-\frac{1}{2}}^{n}(ln\, n)dt+\frac{1}{2}ln\, n \newline
& = ln(n-1)!+\frac{1}{2}ln\, n+\frac{1}{2}ln\, n \newline
& = ln\, n!\end{align}$$

<br />

We have the identity that 

$$I(x)=\int\_{0}^{x}(ln\, t)dt=x\, ln\, x - x$$

so it is natural to approximate the sum in $\eqref{ref4}$ by

$$\sum\_{k=1}^{n-1}\int\_{k-\frac{1}{2}}^{k+\frac{1}{2}}(ln\, t)dt+\int\_{n-\frac{1}{2}}^{n}(ln\, t)+\frac{1}{2}ln\, n=\int\_{\frac{1}{2}}^{n}(ln\, t)dt+\frac{1}{2}ln\, n = I(n)-I(\frac{1}{2})+\frac{1}{2}ln\, n$$

Hence, what remains is to bound the error of the approximation. To do so, let us define that 

$$\begin{align}a_k & = \frac{1}{2}ln\, k-\int\_{k-\frac{1}{2}}^{k}(ln\, t)dt \newline 
b_k & = \int\_{k}^{k+\frac{1}{2}}(ln\, t)dt-\frac{1}{2}ln\, k\end{align}$$

<br />

where $k = 1, 2, \dotsb$.

<br />

As $a_k-b_k=ln\, k-\int\_{k-\frac{1}{2}}^{k+\frac{1}{2}}(ln\, t)dt$,

$$\begin{equation}\begin{split}\sum\_{k=1}^{n-1}(a_k-b_k)+a_n & = \sum\_{k=1}^{n-1}ln\, k-\sum\_{k=1}^{n-1}\int\_{k-\frac{1}{2}}^{k+\frac{1}{2}}ln\, t\, dt+\frac{1}{2}ln\, n-\int\_{n-\frac{1}{2}}^{n}ln\, t\, dt \newline
& = ln\, n!-\frac{1}{2}ln\, n-\int\_{\frac{1}{2}}^{n}ln\, t\, dt \newline
& = ln\, n!-\frac{1}{2}ln\, n-I(n)+I(\frac{1}{2})\end{split}\label{ref5}\end{equation}$$

<br />

The result of $\eqref{ref5}$ implies that the alternating sum converges to a finite number (i.e. $S=\sum\_{k=1}^{\infty}(a_k-b_k) < \infty$), which is a helpful statement that we'll make use of further in the proof. But before moving onto that, we'll first develop some other useful tools required to complete the proof, that is, for $k=1,\, 2,\,\dotsb$,

<br />

$$\begin{equation}a_k=\int\_{0}^{\frac{1}{2}}ln\frac{1}{1-\frac{t}{k}}dt\label{ref6}\end{equation}$$

<br />

$$\begin{equation}b_k=\int\_{0}^{\frac{1}{2}}ln(1+\frac{t}{k})dt\label{ref7}\end{equation}$$

<br />

This could also be proven trivially by integration,

$$\begin{equation}\begin{split}a_k & = \frac{1}{2}ln\, k-\int\_{k-\frac{1}{2}}^{k}(ln\, t) dt\qquad(by\,definition) \newline
& = \frac{1}{2}[k\, ln\, k-k-(k -\frac{1}{2})ln(k-\frac{1}{2})+k-\frac{1}{2}] \newline
& = \frac{1}{2}+\frac{1}{2}ln\, k- k\, ln\, k+(k-\frac{1}{2})ln(k-\frac{1}{2}) \newline
& = \frac{1}{2}-(k-\frac{1}{2})ln\, k+(k - \frac{1}{2})ln(k-\frac{1}{2}) \newline 
& = \frac{1}{2}-(k-\frac{1}{2})ln \frac{k}{k-\frac{1}{2}}\end{split}\label{ref8}\end{equation}$$

<br />

Looking back at $\eqref{ref6}$, 

$$\begin{split}RHS & = \frac{1}{2}ln(\frac{1}{1-\frac{1}{2k}})+k\, ln(k-\frac{1}{2})+\frac{1}{2}-k\, ln\, k \newline
& = \frac{1}{2}-k\, ln \frac{k}{k-\frac{1}{2}}+\frac{1}{2}ln \frac{1}{1-\frac{1}{2k}} \newline
& = \frac{1}{2}-k\, ln \frac{k}{k-\frac{1}{2}}+\frac{1}{2}ln\frac{k}{k-\frac{1}{2}} \newline
& = \frac{1}{2}-(k-\frac{1}{2})ln \frac{k}{k-\frac{1}{2}} \newline
& = a_k\qquad by\,\eqref{ref8}\end{split}$$

<br />

Similarly, for $b_k$,

$$\begin{equation}\begin{split}b_k & = \int\_{k}^{k+\frac{1}{2}}(ln\, t)dt-\frac{1}{2}ln\, k\quad (by\, definition) \newline
& = (k+\frac{1}{2})ln(k+\frac{1}{2})-(k+\frac{1}{2})-k\, ln\, k+k-\frac{1}{2}ln\, k\newline
& = -\frac{1}{2}+(k+\frac{1}{2})ln(k+\frac{1}{2})-(k+\frac{1}{2})ln\, k \newline
& = -\frac{1}{2}+(k+\frac{1}{2})ln(\frac{k+\frac{1}{2}}{k})\end{split}\label{ref9}\end{equation}$$

<br />

Looking back at $\eqref{ref7}$, $$\begin{split}RHS & = -\frac{1}{2}+\frac{1}{2}ln(\frac{1}{2k}+1)+k\, ln(\frac{1}{2}+k)-k\, ln\, k\newline
& = -\frac{1}{2}+\frac{1}{2}ln(\frac{1}{2k}+1)+k\, ln (\frac{k+\frac{1}{2}}{k}) \newline
& = -\frac{1}{2}+\frac{1}{2}ln(\frac{k+\frac{1}{2}}{k})+k\, ln(\frac{k+\frac{1}{2}}{k})\newline
& = -\frac{1}{2}+(k+\frac{1}{2})ln(\frac{k+\frac{1}{2}}{k})\qquad by\,\eqref{ref9}\end{split}$$

<br />

We've already discussed that $S=\sum\_{k=1}^{\infty}(a_k-b_k)<\infty$ after proving $\eqref{ref5}$, now that we have proven $\eqref{ref6}$ and $\eqref{ref7}$, we're finally able to figure  out what $S$ is. In order to prove the Stirling's formula, we should write $S$ as $$\begin{equation}S=I(\frac{1}{2})-\int\_{0}^{\frac{1}{2}}ln\, \phi (t)dt\label{ref10}\end{equation}$$

<br />

where $$\phi (t)=t\prod\_{k=1}^{\infty}(1-\frac{t^2}{k^2})=\frac{\sin\,\pi t}{\pi}$$

<br />

Let's prove it by using the identities of $\eqref{ref6}$ and $\eqref{ref7}$, 

$$\begin{align}S & = \sum\_{k=1}^{\infty}(a_k-b_k)\qquad (by\, definition) \newline
& = \sum\_{k=1}^{\infty} ( \int\_{0}^{\frac{1}{2}}ln\frac{1}{1-\frac{t}{k}}dt-\int\_{0}^{\frac{1}{2}}ln(1+\frac{t}{k})dt ) \qquad (by\,\eqref{ref6},\,\eqref{ref7}) \newline
& = \sum\_{k=1}^{\infty}\int\_{0}^{\frac{1}{2}}(ln\frac{k}{k-t}-ln\frac{k+t}{k})dt \newline
& = \sum\_{k=1}^{\infty}\int\_{0}^{\frac{1}{2}}ln\frac{k\cdot k}{(k-t)(k+t)}dt \newline
& = \sum\_{k=1}^{\infty}\int\_{0}^{\frac{1}{2}}ln\frac{k^2}{k^2-t^2}dt \newline
& = -\sum\_{k=1}^{\infty}\int\_{0}^{\frac{1}{2}}ln\frac{k^2-t^2}{k^2}dt \newline
& = -\sum\_{k=1}^{\infty}\int\_{0}^{\frac{1}{2}}ln(1-\frac{t^2}{k^2})dt \newline
& = -\int\_{0}^{\frac{1}{2}} (ln(1-\frac{t^2}{1^2})+ln(1-\frac{t^2}{2^2})+\dotsb +ln(1-\frac{t^2}{n^2}))dt\quad (n\to\infty) \newline
& = -\int\_{0}^{\frac{1}{2}}ln(\prod\_{k=1}^{\infty}(1-\frac{t^2}{k^2}))dt \newline
& = \int\_{0}^{\frac{1}{2}}ln\, t\, dt-\int\_{0}^{\frac{1}{2}}ln\, t\, dt-\int\_{0}^{\frac{1}{2}}ln(\prod\_{k=1}^{\infty}(1-\frac{t^2}{k^2}))dt \newline
& = \int\_{0}^{\frac{1}{2}}ln\, t\, dt-\int\_{0}^{\frac{1}{2}}ln\, t(\prod\_{k=1}^{\infty}(1-\frac{t^2}{k^2}))dt \newline
& = I(\frac{1}{2})-\int\_{0}^{\frac{1}{2}}ln\,\phi (t)\, dt\end{align}$$

<br />

By the fact that $\phi (t)=t\prod\_{k=1}^{\infty}(1-\frac{t^2}{k^2})=\frac{\sin\,\pi t}{\pi}$, we could arrange $\eqref{ref10}$ and rewrite it as $$\begin{equation}S-I(\frac{1}{2})=\frac{1}{2}ln\,\pi-\int\_{0}^{\frac{1}{2}}ln(\sin\,\pi t)dt\label{ref11}\end{equation}$$

<br />

The term $-\int\_{0}^{\frac{1}{2}}ln(\sin\,\pi t)dt$ seems annoying, but fortunately, it could be transformed into a simpler term that we've seen before.

<br />

Since $$\begin{split}\int\_{0}^{\frac{1}{2}}ln(\sin\,\pi t)dt & = \int\_{0}^{\frac{1}{2}}ln(\cos(\pi(\frac{1}{2}-t)))dt \newline
& = \int\_{0}^{\frac{1}{2}}ln(\cos\,\pi u)du\qquad (by\, letting\, u=\frac{1}{2}-t) \newline
& = \int\_{0}^{\frac{1}{2}}ln(\cos\,\pi t)dt\end{split}$$

<br />

and

<br />

$$\begin{split}\int\_{0}^{\frac{1}{2}}ln(\sin\, 2\pi t)dt & = \frac{1}{2}\int\_{0}^{1}ln(\sin\,\pi u)du\qquad (by\, letting\, u=2t) \newline
& = \int\_{0}^{\frac{1}{2}}ln(\sin\,\pi u)du\qquad (by\, symmetry)\newline
& = \int\_{0}^{\frac{1}{2}}ln(\sin\,\pi t)dt\end{split}$$

<br />

we could get

<br />

$$\begin{split}\int\_{0}^{\frac{1}{2}}ln(\sin\,\pi t)dt & = \int\_{0}^{\frac{1}{2}}ln(\sin(\pi t))dt+\int\_{0}^{\frac{1}{2}}ln(\cos(\pi t))dt-\int\_{0}^{\frac{1}{2}}ln(\sin(2\pi t))dt \newline
& = \int\_{0}^{\frac{1}{2}}ln\frac{\sin (\pi t)\,\cos (\pi t)}{\sin (2\pi t)}dt \newline
& = \int\_{0}^{\frac{1}{2}}ln\frac{1}{2}dt\qquad (by\, double\, angle\, formula)\newline
& = -\frac{1}{2}ln\, 2\end{split}$$

<br />

Thus, the equation $\eqref{ref11}$ could be beautifully transformed into $$\begin{equation}S-I(\frac{1}{2})=\frac{1}{2}ln\,\pi+\frac{1}{2}ln\, 2\label{ref12}\end{equation}$$

<br />

Now we've finally got every puzzle pieces, let's put them together to prove Stirling's formula. The basic idea is to merge the two $S-I(\frac{1}{2})$ we know together.

<br />

$$\begin{split}S-I(\frac{1}{2}) & = \lim\_{n\to\infty}\sum\_{k=1}^{n}(a_k-b_k)-I(\frac{1}{2})\qquad (by\, definition) \newline
& = \lim\_{n\to +\infty}\sum\_{k=1}^{n-1}(a_k-b_k)+a_n-I(\frac{1}{2}) \newline
& \quad(\because\lim\_{n\to +\infty}b_n=\lim\_{n\to +\infty}\int\_{0}^{\frac{1}{2}}ln(1+\frac{t}{n})dt=0) \newline
& = \lim\_{n\to +\infty}(ln\, n!-\frac{1}{2}ln\, n-I(n))\qquad (by\,\eqref{ref5})\end{split}$$

<br />

We could also write $S-I(\frac{1}{2})$ as $$S-(\frac{1}{2})=\frac{1}{2}ln\,\pi+\frac{1}{2}ln\, 2\qquad\eqref{ref12}$$

<br />

So, $$\lim\_{n\to +\infty}[ln\, n!-\frac{1}{2}ln\, n-I(n)]=\frac{1}{2}ln\,\pi+\frac{1}{2}ln\, 2$$

<br />

After arranging, we have

<br />

$$\lim\_{n\to +\infty}[ln\, n!-\frac{1}{2}ln\, n-I(n)]-\frac{1}{2}ln\,\pi-\frac{1}{2}\ln\, 2=0$$

<br />

$$\lim\_{n\to\infty}(ln\, n!-\frac{1}{2}ln\, 2-\frac{1}{2}ln\,\pi-n\, ln\, n-\frac{1}{2}ln\, n+n)=0$$

<br />

which is the same as $\eqref{ref3}$ and the original $\eqref{ref2}$, $$\lim\_{n\to\infty}\frac{n!}{\sqrt{2\pi}\cdot n^{n+\frac{1}{2}}\cdot e^{-n}}=1$$

<br />

Congratulations! We've completed the proof, now it's time for us to put it back into our original coin tossing problem, that is, $$P_{2n} = \frac{2n \choose n}{2^{2n}}=\frac{(2n)!}{2^{2n}n!n!}\qquad\qquad\eqref{ref1}$$

<br />

Substitute the $(2n)!$ and $n!$s with what we acquired in the Stirling's formula, $$P_{2n}=\frac{\sqrt{2\pi}\cdot (2n)^{2n+\frac{1}{2}}\cdot e^{-2n}}{2^{2n}\cdot (\sqrt{2\pi}\cdot n^{n+\frac{1}{2}}\cdot e^{-n})^{2}}$$

<br />

Arrange it, and we'll have

$$P\_{2n}=\frac{1}{\sqrt{\pi n}}$$

When $n\to\infty$,

$$P\_{2n}=\lim\_{n\to +\infty}\frac{1}{\sqrt{\pi n}}=0$$

<br />

Surprisingly, it equals to zero, meaning that it is very unlikely that you would attend exactly half of the lectures after many days has passed.

<br />

# III. A More Quantitative formula: Bounding the error

We have now seen the proof and a simple application of Stirling's formula. However, since it is a method by approximating the value of $n!$, we had better know the bounds of the error in order to fully understand the formula. he more quantitative error bounding formula is simply $$1<\frac{n!}{\sqrt{2\pi\cdot n^{n+\frac{1}{2}}\cdot e^{-n}}}<e^{\frac{1}{8n}}$$ for any $n\geq 1$.

<br />

The proof of this equation requires some of the tools we developed earlier. From $\eqref{ref6}$ and $\eqref{ref7}$, we know that $a\_k>b\_k>a\_{k+1}>0$ because for $t\in (0, \frac{1}{2} ] $,

$$1+\frac{t}{k}>1$$

$$ln(1+\frac{t}{k})>0$$

<br />

We have $b\_k>0$ for all $k$.

<br />

Also, $$a_k-b_k=\int\_{0}^{\frac{1}{2}}ln\frac{k^2}{k^2-t^2}dt\qquad (from\,\eqref{ref6},\,\eqref{ref7})$$

<br />

for $t\in (0, \frac{1}{2}]$,

<br />

$$\frac{k^2}{k^2-t^2}>1$$

<br />

$$ln\frac{k^2}{k^2-t^2}>0$$

<br />

We have $a_k-b_k>0$ for all $k$.

<br />

And that,

$$b\_k-a\_{k+1}=\int\_{0}^{\frac{1}{2}}ln\frac{(k^2+k)-(t^2-t)}{k^2+k}dt\qquad (from\,\eqref{ref6},\,\eqref{ref7})$$

<br />

for $t\in (0,\frac{1}{2}]$,

<br />

$$\frac{(k^2+k)-(t^2-t)}{k^2+k}>1$$

<br />

$$ln\frac{(k^2+k)-(t^2-t)}{k^2+k}>0$$

<br />

We have $b\_k-a\_{k+1}>0$ for all $k$.

<br />

Combine the above three inequalities, we have

<br />

$$\begin{equation}a\_k>b\_k>a\_{k+1}>0\label{ref13}\end{equation}$$

<br />

Let us further define the approximation error by

<br />

$$E\_n=ln\, n!-\frac{1}{2}ln\, n-I(n)-[S-I(\frac{1}{2})]=b_n-a\_{n+1}+b\_{n+2}-\dotsb$$

<br />

By $\eqref{ref13}$, we have

<br />

$$E\_n=(b\_n-a\_{n+1})+(b\_{n+1}-a\_{n+2})+\dotsb >0$$

<br />

$$b\_n-E\_n=(a\_{n+1}-b\_{n+1})+(a\_{n+2}-b\_{n+2})+\dotsb >0$$

<br />

From this result, we could show that $$\begin{equation}0<E_n<b_n\leq\frac{1}{8n}\label{ref14}\end{equation}$$

<br />

because

<br />

$$\begin{split}b\_n & = \int\_{0}^{\frac{1}{2}}ln(1+\frac{t}{n})dt\qquad (from\,\eqref{ref7}) \newline
\leq & \int\_{0}^{\frac{1}{2}}\frac{t}{n}dt \newline
  \qquad &(\because\, ln(1+x)\leq x\, for\, x \geq 0) \\ =&\frac{1}{8n}\end{split}$$

<br />

Transform $\eqref{ref14}$ into $$e^0 < e^{E\_n} < e^{\frac{1}{8n}}$$

<br />

Plug $E\_n=ln\, n!-\frac{1}{2}ln\, n-I(n)-[S-I(\frac{1}{2})]$ and $e^0 = 1$ into it, we'll get:

<br />

$$1<e^{(ln\, n!-\frac{1}{2}ln\, n-I(n)-[S-I(\frac{1}{2})])}<e^{\frac{1}{8n}}$$

<br />

After arranging, we have $$1<\frac{n!}{\sqrt{2\pi\cdot n^{n+\frac{1}{2}}\cdot e^{-n}}}<e^{\frac{1}{8n}}$$

<br />

which is the desired error bound.

<br />

# IV. Conclusion: Further Applications

After understanding the proof of Stirling's formula, it's time for us to discover the applications of it.

<br />

Generally, whenever you have to approximate $n!$, Stirling's formula would very likely be the tool you need to use. For example, when calculating probabilities, we often run into the problematic term $n!$, just like what we have encountered in the first example.

<br />

Another place where Stirling's formula is useful is in the field of computer science. When you write a function to calculate the value of $n!$, the most intuitive way is to multiple all the numbers from $2$ to $n$ to get the final result, just as the following implementation.

<br />

{{< highlight python "linenos=table" >}}
factorial(n):
    if (n=0) return 1
    else return n*factorial(n-1)
{{< / highlight >}}

<br />

This algorithm is linear, meaning that it would run in $O(n)$ time. However, if you write the function with another algorithm, using Stirling's formula,

<br />

{{< highlight python "linenos=table" >}}
factorial(n):
    return sqrt(PI*2)*pow(n / E, n)
{{< / highlight >}}

<br />

it would be less time-consuming, since the calculation of $n$ to the $n$-th power (aka. the $(\frac{n}{e})^{n}$ is only $O(log\, n)$.

<br />

Through this simple yet elegant equation, much of the complexities in algorithms could be reduced and let us understand further in the fields of mathematics and engineering.