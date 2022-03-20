---
title: Taylor Expansions
tags: [math]
mathjax: true
---

Taylor expansions are really cool! It turns out,

$$\sin{x} = x - \frac{x^3}{3!} + \frac{x^5}{5!} - \frac{x^7}{7!} + \dots,$$ 

and that's actually how your calculator calculates sin. The idea is that you can write any function as a polynomial like that

The reason this works is that if you want to approximate a function, a good way to do that is to start and say "I want the value of the function at 0 to equal my approximation", so $\sin{x} = 0$

Then, you say "I want the derivative of my function at 0 to equal the derivative of my approximation" -- since the derivative of sin is cos, and cos(0) = 1, you have $\sin{x} = 0 + x$. Conveniently, no matter what your constant terms were before the x, they'll differentiate out to zero, and your terms after the x, are all higher order, so they also become zero

Then you say, "I want the second derivative (concavity) of my function at zero to equal the second derivative of my Approxmation". The second derivative of $\sin$ is $-\sin$, $-\sin{0} = 0$. But wait, there's a catch, you're making that zero the coefficient of the x^2 term, but after you apply power rule, that 2 is going to come out in front when you take the second derivative, so to compensate, you have to divide by two. So you have $\sin{x} = 0 + x + 0/2 * x^2$.

Repeat for the third derivative, you have $-\cos{0} = -1$, $\sin{x} = 0 + x + 0/2 x^2 + -1/(3 * 2) x^3$, and so on.

If you want to move it around, so its not at zero, then you just replace every x with an (x-a)

If you know where the function is, and you know what the slope is, and you know what the concavity is, and you know what the torsion is (that's like concavity for third derivative), and so on, you basically know the function.

Unfortunately, it turns out there's some functions (like $\ln{(x + 1)}$) where the Taylor polynomial a point doesn't actually have enough "information" to graph the whole function, it's only accurate in the region $-1 < x < 1$.

<iframe src="https://www.desmos.com/calculator/xitmjzi9xl?embed" width="500" height="500" style="border: 1px solid #ccc" frameborder=0></iframe>

Turn up the $a$ value in the Desmos graph above and you can sorta see why it doesn't converge when $x > 1$.
