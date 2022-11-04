---
title: Why is the Central Limit Theorem true?
tags: [math]
mathjax: true
---

This proof came about after learning about the central limit theorem in my AP Statistics class, where it was presented without proof. It wasn't intuitively obvious to me that the theorem was true, so I decided to spend some time learning about it. I've written up a proof, and tried to keep it at a level that someone who has only taken AP Statistics and Calculus should be able to follow (knowledge of Taylor expansions is a pre-requisite, but I already have an article explaining those, and familiarity with Fourier transforms would help, but shouldn't be strictly necessary).

$$
\require{physics}
\newcommand{\intr}{\int _{-\infty} ^{\infty}}
\newcommand\fourier[1]{\mathcal{F}#1}
\newcommand{\dx}{\dd x}
\newcommand{\dy}{\dd y}
\newcommand{\dz}{\dd z}
\newcommand{\dxi}{\dd \xi}
\newcommand{\uh}{\hat{u}}
\newcommand{\vh}{\hat{v}}
\newcommand{\E}{\mathbb E}
$$

# Convolutions

The **convolution** of two functions $u$ and $v$ is given by

$$ (u * v)(x) \equiv \int _{-\infty} ^{\infty}u(x - y)v(y) \dd y= \int _{-\infty} ^{\infty}u(y)v(x - y) \dd y.  $$

In essence, the operation of convolution takes two functions, slides one
along the other, and at each point measures how much they overlap. The
operation of convolution is both commutative and associative.

## Sum of Random Variables

Let $Z = X + Y$ by the sum of two independent, continuous random
variables $X$ and $Y$, with probability density functions $f_X$ and
$f_Y$. The cumulative distribution function $F_Z$ is given by

$$\begin{aligned}
    F_Z(a) &= P(X + Y \leq a) \\
           &= \iint _{x + y \leq a} f_X(x) f_Y(y) \dd x\dd y\\
           &= \int _{-\infty} ^{\infty}\int _{-\infty} ^{a-y} f_X(x) f_Y(y) \dd x\dd y\end{aligned}$$

Note that the second line follows from the fact that $X$ and $Y$ are
independent, so we can just multiply the values of their respective
probability density functions to get the probability that both random
variables are those particular values. The third line is true because
for *any* $y$, we can pick an $x \leq a-y$, which will enforce that
$x + y \leq a$. Finally, the inner integral is over $x$, so we can take
the factor of $f_Y(y)$ out, giving,

$$F_Z(a) = \int _{-\infty} ^{\infty}\int _{-\infty} ^{a-y} f_X(x) \dd xf_Y(y) \dd y.$$

Next, notice that the inner integral $\int _{-\infty} ^{a-y} f_X(x)$ is
by definition the cumulative distribution function of $X$ evaluated at
$a-y$, so

$$F_Z(a) = \int _{-\infty} ^{\infty}F_X(a-y) f_Y(y) \dd y.$$

Finally, lets differentiate this to get a probability density function
again:

$$\begin{aligned}
    \dv{F_Z(a)}{a} &= \dv{}{a} \int _{-\infty} ^{\infty}F_X(a-y) f_Y(y) \dd y\\
                   &= \int _{-\infty} ^{\infty}\dv{}{a} F_X(a-y) f_Y(y) \dd y\end{aligned}$$

We can switch the integral and the derivative, since the limits of
integration are constant. Additionally, notiec that $f_Y(y)$ does not
depend on $a$, so we only need to differentiate $F_X(a-y)$ with respect
to $a$, which is $f_X(a-y)$ by definition. So therefore,

$$\begin{aligned}
    f_Z(x) &= \int _{-\infty} ^{\infty}f_X(x-y) f_Y(y) \dd y\\
    f_{X+Y} &= f_X * f_Y.\end{aligned}$$

In other words, when you add two random variables, you take the
convolution of their PDFs.

# Central Limit Theorem

The central limit theorem says that given $n$ independent and identically
distributed (i.i.d) random variables $X_1, X_2, ..., X_n$, the distribution of
their sum $X = X_1 + X_2 + ... + X_n$ approaches a normal distribution as $n
\to \infty$ with mean $n\mu$ and standard deviation $\sigma \sqrt{n}$. 

The key idea in this proof is quite simple. If the probability density
function of each of the random variables $X_i$ is called $f$ (they are
all identical, so there is no point distinguishing between them), then
the PDF of their sum $X$ is just the convolution of f with itself $n$
times, $f_X = f * f * \dots * f$.

Essentially, all the probability work is already done--what remains is
simply to prove a property of convolutions, that the convolution of a
function with itself, repeatedly, approaches the Gaussian. We will do
this by finding the Fourier transform of $f_X$, because convolution in
the Fourier domain is simply multiplication.

But before jumping into the calculations, just as a matter of intuition,
lets establish why would expect the convolution of a function with
itself repeatedly to approach a normal distribution, but considering
what happens to a constant function. If $u(x) = \frac{1}{2}$ on
$-1 \leq x \leq 1$, and $0$ eveywhere else, then $u * u$ is a hat
function, $\frac{1}{2}(1 - \frac{\abs{x}}{2})$ on $-2 \leq x \leq 2$,
and $u * u * u$ is a quadratic that looks very much like the normal
distribution indeed. In fact, these functions are called the **B-spline
functions**.

# Fourier Transform

For a more thorough and wonderfully visual introduction to the Fourier
transform, check out the following video from 3Blue1brown:

<iframe width="560" height="315" src="https://www.youtube.com/embed/spUNpyF58BY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

For any function $u \in L^2$, its **Fourier Transform** $\hat{u}$ is
defined as

$$\label{def:fourier-transform}
    \hat{u}(\xi) = (\mathcal{F}u)(\xi) = \int _{-\infty} ^{\infty}u(x) e^{-i\xi x} \dd x. \\$$

The **Inverse Fourier transform** describes how to go the other way

$$\label{def:inv-fourier-transform}
    u(x) = (\fourier^{-1}\hat{u})(x) = \frac{1}{2\pi} \int _{-\infty} ^{\infty}\hat{u}(\xi) e^{i\xi x} \dd \xi. \\$$

Because the fourier transform is invertible, in some sense, $u$ and
$\hat{u}$ are two sides of the same coin--where $u$ represents the
function in the spatial domain, $\hat{u}$ represents the function in the
frequency domain.

## Convolutions in the Frequency Domain

Conveniently, many operations are much simpler to apply to the
Fourier-transformed version of a function. For example, differentiating
a function in the frequency domain is just multiplying by $i$ (that is,
$\mathcal{F}\{u'\} = i \mathcal{F}\{u\}$). This is not too difficult to
prove, and makes for an interesting exercise--intuitively, the reason
for this is that the derivative of $\sin$ is $\cos$, and the derivative
of $\cos$ is $-\sin$, and multiplying by $i$ in the frequency domain
corresponds to offsetting frequencies by $\frac \pi 2$.

Convolution is also much simpler in the frequency domain. In particular,
$\mathcal{F}\{u * v\} = \hat{u}\hat{v}$. Convolution in the spatial
domain is just multiplication in the frequency domain. Lets prove this!

$$\begin{aligned}
    \mathcal{F}\{u * v\}(\xi) &= \int _{-\infty} ^{\infty}(u * v)(x) e^{-i\xi x} \dd x\\
                               &= \int _{-\infty} ^{\infty}\int _{-\infty} ^{\infty}u(x-y)v(y) \dd ye^{-i\xi x} \dd x\\
                               &= \int _{-\infty} ^{\infty}\int _{-\infty} ^{\infty}u(x-y)v(y) e^{-i\xi x} \dd y\dd x.\end{aligned}$$

Since the limits are constant, we can swap the order of the integrals.

$$\begin{aligned}
     \mathcal{F}\{u * v\}(\xi) &= \int _{-\infty} ^{\infty}\int _{-\infty} ^{\infty}u(x-y)v(y) e^{-i\xi x} \dd x\dd y\\
                                &= \int _{-\infty} ^{\infty}v(y) \int _{-\infty} ^{\infty}u(x-y) e^{-i\xi x} \dd x\dd y\end{aligned}$$

Now perform a substitution, $z = x - y$, so $x = z + y$, $\dd x= \dd z$,

$$\begin{aligned}
     \mathcal{F}\{u * v\}(\xi) &= \int _{-\infty} ^{\infty}v(y) \int _{-\infty} ^{\infty}u(z) e^{-i\xi (z + y)} \dd z\dd y\\
                                &= \int _{-\infty} ^{\infty}v(y) \int _{-\infty} ^{\infty}u(z) e^{-i\xi z} e^{-i\xi y} \dd z\dd y\\
                                &= \int _{-\infty} ^{\infty}v(y) e^{-i\xi y} \int _{-\infty} ^{\infty}u(z) e^{-i\xi z} \dd z\dd y\\
                                &= \int _{-\infty} ^{\infty}v(y) e^{-i\xi y} \dd y\int _{-\infty} ^{\infty}u(z) e^{-i\xi z} \dd z\\
                                &= \hat{v}(\xi) \hat{u}(\xi).\end{aligned}$$

# Proving the Central Limit Theorem

The Fourier transform a probability density function $f$ is sometimes
called its "characteristic function" and denoted with the letter $\Phi$.

$$\Phi (\xi) = (\mathcal{F}f) (\xi) = \int _{-\infty} ^{\infty}f(x) e^{-i\xi x} \dd x$$

The PDF corresponding to the random variable $X$ is
$f_X = f * f * \dots * f$, and its characteristic function is
$\left[\Phi(\xi)\right]^n$, because convolving together two functions
corresponds to merely multiplying their Fourier transforms.

Next, let $\Psi(\xi) = \log (\Phi(\xi))$, and then Taylor expand,
$\Psi(\xi) = C_0 + C_1 \xi + \frac{C_2 \xi^2}{2} + O(\xi^3)$. These
coefficients $C_i$ are referred to as the "cumulants" of the probability
distribution. We are going to only use the first 3 terms of the Taylor
expansion, and drop terms 3rd order and above.

## Computing the cumulants

### $C_0$

Lets start with $C_0$. This is just $\Psi$ evaluated at $0$.

$$\begin{aligned}
    C_0 &= \Psi(0) \\
        &= \log \int _{-\infty} ^{\infty}f(x) e^0 dx \\
        &= \log \int _{-\infty} ^{\infty}f(x) dx \\
        &= \log(1) = 0,\end{aligned}$$

since $f$ is a PDF.

### $C_1$

Onto $C_1$! This is the derivative of $\Psi$ evaluated at $0$.

$$\begin{aligned}
    C_1 &= \Psi'(0) \\
        &= \frac{\Phi'(0)}{\Phi(0)} \\
        &= \phi'(0),\end{aligned}$$

since we already know that $\Phi(0) = 1$. We can calculate $\Phi'$ as
follows:

$$\begin{aligned}
    \Phi(\xi) &= \int _{-\infty} ^{\infty}f(x) e^{-i \xi x} \dd x\\
    \dv{\Phi(\xi)}{\xi} &= \dv{\xi} \int _{-\infty} ^{\infty}f(x) e^{-i \xi x} \dd x\\
                        &= \int _{-\infty} ^{\infty}f(x) \dv{\xi} e^{-i \xi x} \dd x\\
                        &= -\int _{-\infty} ^{\infty}ix f(x) e^{-i \xi x} \dd x\\
                        &= -i \int _{-\infty} ^{\infty}x f(x) e^{-i \xi x} \dd x\\
    \Phi'(0) &= -i \int _{-\infty} ^{\infty}x f(x) \dd x\\
             &= -i \mu,\end{aligned}$$

because $\int _{-\infty} ^{\infty}x f(x) \dd x$ is by definition the
mean.

### $C_2$

Finally, $C_2$. Now we need the second derivative of $\Psi$ at 0. We
omit the explicit dependence on $\xi$ here for ease of readability.

$$\begin{aligned}
    \Psi''(\xi) &= \dv{\xi} \frac{\Phi'}{\Phi} \\
                &= \frac{\Phi'' \Phi - \Phi'^2}{\Phi^2}.\end{aligned}$$

But note that $\Phi(0) = 1$, so the denominator is just $1$, and the
numerator simplifies to $\Phi''(0) - \Phi'^2(0)$. We already know that
$\Phi'(0)$ equals $-i \mu$, so $\Phi'(0)^2 = -\mu^2$. Finally, lets
calculate $\Phi''$, using the same logic as before.

$$\begin{aligned}
    \Phi'(\xi) &= -i \int _{-\infty} ^{\infty}x f(x) e^{-i \xi x} \dd x\\
    \dv{\xi} \Phi'(\xi) &= -i \dv{\xi} \int _{-\infty} ^{\infty}x f(x) e^{-i \xi x} \dd x\\
                        &= -i  \int _{-\infty} ^{\infty}x f(x) \dv{\xi} e^{-i \xi x} \dd x\\
                        &= -\int _{-\infty} ^{\infty}x^2 f(x) e^{-i \xi x} \dd x\\
    \Phi''(0)  &= -\int _{-\infty} ^{\infty}x^2 f(x) \dd x\\
              &= -\mathbb E[X^2].\end{aligned}$$

Putting it all together,

$$\begin{aligned}
    C_2 &= \Psi''(0) \\
        &= \frac{\Phi'' \Phi - \Phi'^2}{\Phi^2} \\
        &= \Phi'' - \Phi'^2 \\
        &= \Phi'' - (-\mu^2) \\
        &= -\mathbb E[X^2] + \mu^2 \\
        &= \mu^2 - \mathbb E[X^2] \\
        &= -\sigma^2.\end{aligned}$$

$C_2$ is (negative) the variance! Incidentally, it is the case in
general that $\mathbb E[X^2] - \mu^2 = \sigma^2$, this is quite easy to
verify:

$$\begin{aligned}
    \text{Var}(X) = \sigma_X^2 &= \mathbb E[(X - \mu)^2] \\
                               &= \mathbb E[X^2 - 2\mu X + \mu^2] \\
                               &= \mathbb E[X^2] - 2\mu\mathbb E[X] + \mu^2 \\
                               &= \mathbb E[X^2] - 2\mu^2 + \mu^2 \\
                               &= \mathbb E[X^2] - \mu^2.\end{aligned}$$

## Home stretch

We now have the third order Taylor expansion of $\Psi$.

$$\Psi(\xi) \approx -i\mu \xi - \frac{\sigma^2 \xi^2}{2}.$$

We can get the characteristic function $\Phi$ from this,

$$\begin{aligned}
    \Phi(\xi) &= \exp(\Psi(\xi)) \\ 
              &\approx \exp(-i\mu \xi - \frac{\sigma^2 \xi^2}{2}).\end{aligned}$$

Notice that this already is looking like a Gaussian -- something like
$e^{-x^2}$. The Fourier transform of a Gaussian is also a Gaussian
(which we will prove in the next section), so this is a good sign.
Recall that the whole reason we went through the the Fourier domain was
so we could use $[\Phi]^n$, instead of having to convolve $f$ with
itself $n$-times. Conveniently, since $\Phi$ is already an exponential,
this is quite simple.

$$\begin{aligned}
\left[\Phi(\xi) \right]^n &\approx [\exp(-i\mu \xi - \frac{\sigma^2 \xi^2}{2})]^n \\
                  &\approx \exp(-in\mu \xi - \frac{n\sigma^2 \xi^2}{2})\end{aligned}$$

We can now perform the *inverse* Fourier transform on $\Phi^n$, to get
back to the probability density function.

$$\begin{aligned}
    f_X(x) &= \fourier^{-1}\{\Phi^n\}(x) \\
           &= \frac{1}{2\pi} \int _{-\infty} ^{\infty}[\Phi(\xi)]^n e^{i\xi x} \dd \xi\\
           &\approx \frac{1}{2\pi} \int _{-\infty} ^{\infty}\exp(-in\mu \xi - \frac{n\sigma^2 \xi^2}{2}) e^{i\xi x} \dd \xi\\
           &\approx \frac{1}{2\pi} \int _{-\infty} ^{\infty}\exp(i \xi x - in\mu \xi - \frac{n\sigma^2 \xi^2}{2})  \dd \xi\\
           &\approx \frac{1}{2\pi} \int _{-\infty} ^{\infty}\exp(- \frac{n\sigma^2 \xi^2}{2})  e^{i \xi (x - n\mu)} \dd \xi\end{aligned}$$

Observe that that is an inverse Fourier Transform of the Gaussian
$\exp(- \frac{n\sigma^2 \xi^2}{2})$. We just need to show that is
another Gaussian!

## Last Step: Fourier Transform of a Gaussian

In this section, we take it as given that the area under a normal
distribution is 1.

$$\begin{aligned}
    g(x) &= \frac{1}{\sqrt{2\pi}\sigma} e^{-\frac{(x-\mu)^2}{2\sigma^2}} \\
    \int _{-\infty} ^{\infty}g(x) \dd x&= \frac{1}{\sigma\sqrt{2\pi}} \int _{-\infty} ^{\infty}e^{-\frac{(x-\mu)^2}{2\sigma^2}} \dd x\\
                   &= 1. \\
    \int _{-\infty} ^{\infty}e^{-\frac{(x-\mu)^2}{2\sigma^2}} \dd x&= \sigma\sqrt{2\pi}\end{aligned}$$

This can be proved by computing the square of the integral by
transforming to polar coordinates.

We want to evaluate the following Fourier transform of the Gaussian.

$$\begin{aligned}
& \frac{1}{2\pi} \int _{-\infty} ^{\infty}\exp(- \frac{n\sigma^2 \xi^2}{2})  e^{i \xi (x - n\mu)} \dd \xi\\
&= \frac{1}{2\pi} \int _{-\infty} ^{\infty}\exp(- \frac{n\sigma^2 \xi^2}{2} + \xi i (x - n\mu)) \dd \xi\end{aligned}$$

The key idea is to complete the square. Let $a = -\frac{n \sigma^2}{2}$
and $b=i (x - n\mu)$. Then we have

$$\begin{aligned}
    - \frac{n\sigma^2 \xi^2}{2} + \xi i (x - n\mu) &= a\xi^2 + b\xi \\
                                                   &= a\xi^2 + b\xi + \frac{b^2}{4a^2} - \frac{b^2}{4a^2}\\
                                                   &= a\left(\xi + \frac{b}{2a}\right)^2 - \frac{b^2}{4a^2}\end{aligned}$$

Lets substitute this back into the integral:

$$\begin{aligned}
    & \frac{1}{2\pi} \int _{-\infty} ^{\infty}\exp(- \frac{n\sigma^2 \xi^2}{2} + \xi i (x - n\mu)) \dd \xi\\
&= \frac{1}{2\pi} \int _{-\infty} ^{\infty}\exp(a\xi^2 + b\xi) \dd \xi\\
&= \frac{1}{2\pi} \int _{-\infty} ^{\infty}\exp(a\left(\xi + \frac{b}{2a}\right)^2 - \frac{b^2}{4a}) \dd \xi\\
&= \frac{1}{2\pi} \int _{-\infty} ^{\infty}\exp(a\left(\xi + \frac{b}{2a}\right)^2) \exp(-\frac{b^2}{4a}) \dd \xi\\
&= \frac{1}{2\pi} \exp(-\frac{b^2}{4a})  \int _{-\infty} ^{\infty}\exp(a\left(\xi + \frac{b}{2a}\right)^2) \dd \xi\\
&= \frac{1}{2\pi} \exp(-\frac{b^2}{4a})  \int _{-\infty} ^{\infty}\exp(-\frac{n \sigma^2}{2} \left(\xi - \frac{i (x - n\mu)}{n \sigma^2}\right)^2) \dd \xi\\
&= \frac{1}{2\pi} \exp(-\frac{b^2}{4a})  \sqrt{\frac{2 \pi}{n \sigma^2}} \\
&= \frac{1}{2\pi} \sqrt{\frac{2 \pi}{n \sigma^2}}  \exp(-\frac{(i (x - n\mu))^2}{4(-\frac{n \sigma^2}{2})})  \\
&= \frac{1}{\sqrt{2\pi n \sigma^2}} \exp(-\frac{(x - n\mu)^2}{2n\sigma^2}) \\
&= \frac{1}{\sqrt{2\pi n \sigma^2}} e^{-\frac{(x - n\mu)^2}{2n\sigma^2}},\end{aligned}$$

which is just a normal distribution with mean $n\mu$ and standard
deviation $\sqrt{n}\sigma$. And we're done!.


# Acknowledgements
The essential idea of this proof is from Jaynes [2003], which he presents in section 7.16,
though I have of course filled out many of the details (the original proof is about half a
page, and leaves the derivation of the cumulants to an appendix). The proof of the sum of
two random variables is from Ross [2014]. And finally, much of the development of Fourier
transforms I described is largely derived from Trefethen [1996]. While writing this up, I also
referenced Feller [1957], Papoulis and Pillai [2002], and Bertsekas and Tsitsiklis [2008].

# References
* Edwin T Jaynes. _Probability theory: The logic of science_. Cambridge university press, 2003.
* Sheldon M Ross. _A first course in probability_. Pearson, 2014.
* Lloyd Nicholas Trefethen. _Finite difference and spectral methods for ordinary and partial differential equations_. 1996.
* William Feller. _An introduction to probability theory and its applications_. 1957.
* Athanasios Papoulis and S Unnikrishna Pillai. _Probability, random variables, and stochastic processes_. Tata McGraw-Hill Education, 2002.
* Dimitri P Bertsekas and John N Tsitsiklis. _Introduction to probability_, volume 1. Athena Scientific, 2008.
