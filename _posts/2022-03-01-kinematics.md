---
title: A Small Observation About the Kinematic Equations
tags: [math,physics]
---

A fairly trivial connection I noticed a couple days ago--the kinematic equations are (a) second order accurate time-integration scheme. I was thinking about this while wondering how to teach a bunch of 11th graders taking physics about my senior capstone project, on physics simulation. In particular, I was wondering whether they'd be confused about the fact that the equations for Sympletic Euler integrator I had in my code (and was planning on showing them) didn't match up with the kinematic equations they already knew.

We begin with the differential equations that describe motion:

$$ \dot{x} = v \qquad \dot{v} = a $$

We can discretize these with Forward Euler. I'm using subscripts of $$n$$ to represent time.

$$ x_{n+1} = x_n + \Delta t v_n $$

$$ v_{n+1} = v_n + \Delta t a_n $$

Forward Euler is first order accurate and quite unstable. This is because we are using the _old_ velocity to update position, even though we have a new velocity. If you use forward Euler for a particle rotating in a circle, you will notice that it does not preserve the orbit--instead, the orbit decays steadily. 

A better approach is called Sympletic Euler:

$$ x_{n+1} = x_n + \Delta t v_{n+1} $$

$$ v_{n+1} = v_n + \Delta t a_n $$

Here we use the velocity that we just calculated to update the position. This method is much more stable--in some sense, the _information_ from the acceleration is communicated to the position much faster. Even though Forward Euler and Sympletic Euler are both first-order _accurate_ integration schemes (that is, if $$\Delta t$$ is cut in half, the error will also be cut in half), Sympletic Euler is much more _stable_ than explicit Euler--that is, it is much less likely to "blow up". I refer the reader interested in rigorous definitions and proofs to any Numerical Analysis textbook.

Now if you substitute the second equation in the Sympletic Euler update into the first one, you get 

$$ x_{n+1} = x_n + \Delta t (v_n + \Delta t a_n) = x_n + \Delta t v_n + \Delta t^2 a_n). $$

This differs from the kinematic equations everyone learns in an introductory physics course:

$$ \Delta x = t v_0 + \frac 1 2 a t^2. $$

Where did the factor of 1/2 come from?? Well the answer is that Sympletic Euler is a first-order accurate _approximation_, while the kinematic equations are exact _for constant accelerations_. This leads to the natural question of what discretization actually does correspond to the kinematic equations.  

The key insight here is what it means to be "n-th order accurate". One way to think about it is if $$\Delta t$$ is cut in half, the error will be multiplied by $$(\frac 1 2)^n$$. Another way to think about it is that an n-th order accurate integration scheme integrates (n-1)-th order polynomials exactly right--forward Euler is first order accurate, so it would integrate a constant velocity exactly (if its unclear to you why these two conditions are equivalent, think of the error term in a Taylor expansion--if the error term is $$O(h^2)$$, that means the Taylor series is linear, so would evaluate a linear function exactly). 

Since the kinematic equations get a constant acceleration (i.e. a linear velocity) exactly right, that must mean that they are a second order accurate method. What are the most common second-order-accurate methods everyone learns in Calculus? Trapezoidal Rule and Midpoint Method!

Lets try both.

# Trapezoidal Rule
The trapezoidal rule seems promising, because another one of the kinematic equations we learn in introductory physics is 

$$ \Delta x = \frac{v_0 + v_f}{2} \Delta t, $$

which is essentially trapezoidal rule (and by substituting the velocity update kinematic equation $$v_f = v_0 + at$$, one can derive $$\Delta x = t v_0 + \frac 1 2 a t^2$$). The trapezoidal rule position update would be 

$$ x_{n+1} = x_n + \Delta t \frac{v_n + v_{n+1}}{2} $$

$$ v_{n+1} = v_n + \Delta t a_n. $$

And unsurprisingly, trapezoidal rule in second-order accurate (because it contains the velocity averaging step), so it integrates linear velocities exactly, which is what we want.

Problem solved, right? Unfortunately, trapezoidal rule has a problem, which meant I couldn't really use it for my demonstration with the eleventh graders. In particular, it turns out trapezoidal rule is _unconditionally unstable_ when using it to solve elastic problems--and the SPH fluid simulation I was going to demonstrate was definitely elastic. A quick implementation rapidly demonstrated my fears:   

<iframe width="100%" height="450px" src="https://editor.p5js.org/Rito/full/0xW2Aorfc"></iframe>

That simulation is clearly unstable. Compare that with the simulation from sympletic euler:

<iframe width="100%" height="450px" src="https://editor.p5js.org/Rito/full/Qh9yzoref9"></iframe>

Clearly much more stable.

# Midpoint Rule
Fortunately, there's another possibility! Midpoint rule! Midpoint rule is theoretically second-order accurate, so it _should_ get linear velocities/constant accelerations exactly right, but lets confirm. Where trapezoid rule finds the average of the _velocities_ at the beginning and end of the timestep, the idea behind midpoint rule is to evaluate the velocity directly that the midpoint in _time_. Thus, the update rule would look like:  

$$ x_{n+1} = x_n + \Delta t v_{n+\frac 1 2}$$

$$ v_{n+\frac 1 2} = v_n + \frac{1}{2} \Delta t a_n. $$

Notice that we're still just using ordinary first-order forward Euler for the velocity, we're just evaluating it at a different location instead. Substituting the second equation into the first, we get back to our normal kinematic equation:

$$ x_{n+1} = x_n + \Delta t (v_n + \frac{1}{2} \Delta t a_n) =x_n + \Delta t v_n + \frac{1}{2} \Delta t^2 a_n. $$

Its quite nice that two different second-order time-integration schemes give us the same kinematic equations--I see it as a satisfying demonstration how math is consistent. Even when you take two completely different pathways to solve the problem, through two completely different discretizations, because both discretizations have the same order of accuracy, they give the same result when evaluated on a constant acceleration.  

However, even though midpoint rule and trapezoidal rule are both second order accurate, midpoint rule has far better stability properties (visually, it even looks more stable than symplectic Euler). Take a look:

<iframe width="100%" height="450px" src="https://editor.p5js.org/Rito/full/ZEKpuy5Gq"></iframe>

# Note on Terminology
I've been a bit cavalier with terminology in this article. Technically, forward Euler, trapezoidal rule, and midpoint method refer to method for solving _first order_ differential equations--that is, $$\dot{x} = f(x)$$. When I use these terms, I'm referring to using them for the _position update_--I always use forward Euler for the velocity update. Sympletic Euler, on the other hand, is a scheme for solving _second order_ differential equations--that is $$\ddot{x} = f(x)$$. 

What I refer to as "trapezoidal rule" in this article (which is actually "trapezoidal rule for the position update + forward Euler for the velocity update") is sometimes referred to as "Heun's method" (though I have seen it referred to solely as trapezoidal rule in the literature as well). Similarly, what I refer to as "midpoint method" (which is actually "midpoint method for the position update + forward Euler for the velocity update) is perhaps closer to the second order methods of Leapfrog integration or Verlet integration (though those both use $$a_{n+1}$$ in their velocity update, which I do not).
