---
title: Lagrangian Mechanics
tags: [physics,math]
mathjax: true
---

A writeup explaining Lagrangian mechanics to a friend who asked about the Standard Model Lagrangian.

<img src="https://qph.fs.quoracdn.net/main-qimg-a22ea95a000bf20f76680f732ea18e8c" alt="A giant expression for the Standard Model Lagrangian"/>

Newton's laws provide a framework for doing physics. They say "calculate the net force at each instant, that force causes an acceleration according to $$F = ma$$".

That can be really annoying sometimes, because forces are vectors and adding vectors is kinda tricky, if they're complicated.

A different way to approach it is by formulating everything in terms of energy -- the key idea is the following -- "when we apply a force F to something, we cause it to move some distance d. we'll call the product of these "work", $$W = F d$$". It turns out that we can also assign a number, called the "energy", to a system, and this work represents changes from one type of energy to another. There's "kinetic energy", $$T = 1/2 mv^2$$, and there's potential energy (which depends on which forces are acting on the object. In the case of gravity, the potential energy works out to be $$U = mgh$$, so the greater your height, the more potential energy you have)

The key idea of Lagrangian mechanics is the following -- Lagrange observed that light, normally takes the straight line path between two points, but when it passed through an interface, its angle changed, but also, its velocity changed, and the angle changed such that the total time that the light would take to travel from its origin to its destination was minimized (look up Snell's law and verify this for yourself, its not too hard). He speculated that there might be a quantity that is minimized in the case of matter -- that given some starting point and ending point, this quantity would be minimized, and that would tell you the path that the object took. He called this quantity the "action".

What he then did is defined a new quantity, today called the "Lagrangian" (in honor of lagrange), L = T - U -- kinetic minus potential energy. This quantity doesn't correspond to anything physical, but it turns out to be very important. It turns out that the appropriate definition of the "action" for any particular path is the integral of the Lagrangian, and then, you could minimize the action over the various different paths, and he came up with a differential equation which used solely the Lagrangian and told you what the path should be
so in notation, the action is the integral of the Lagrangian from the beginning to the end:

$$S = \int _{t_1} ^{t_2} L(x(t), \dot x(t), t) dt$$


You work through the derivation of minimizing the action (see this [YouTube video](https://www.youtube.com/watch?v=VCHFCXgYdvY) which I particularly like), and you get the following extremely elegant equation, called the Euler-Lagrange equation:

$$\frac{d}{dt} \frac{\partial L}{\partial \dot q} = \frac{\partial L}{\partial  q} $$

That equation is equivalent to newton's laws, and I'll prove that that to you with the minimal example of a point particle.

But first, as a matter of notation, $$q$$ is referring to some "generalized coordinate" -- this is one of the great powers of Lagrangian mechanics. Newton's laws work well for systems which can be described by vectors with x, y, and z components. But if you don't want to describe your system with Cartesian components (maybe you're describing rotational motion, and you'd rather describe you're system with an angle, theta), then you're stuck -- you have to reformulate all of Newtonian mechanics from the ground up. Instead of having force, you have a totally new quantity "torque" (which is a "generalized force") and there's no guaranteed process for getting from forces to generalized forces (it turns out, in the case of torque, you have to multiply by the radius its rotating around, but that's not at all obvious). Worse, instead of mass, you have a "generalized mass matrix" -- y'know the "rotational inertia" you learned about in physics, which you get by integrating over every point of the solid, which you thought was bad enough? In general, that turns into a matrix, called the "inertia tensor", whose each component is a volume integral -- that is awful, and you really don't want to have to generalize that even further. on the other hand, Lagrangian mechanics just works -- you can pick any coordinates you'd like to describe your system, and as long as you can describe the potential and kinetic energy in terms of those coordinates, which is usually pretty easy, you're done. Finally, on notation $$\dot q$$ means "time derivative of q" -- this would be the components of "velocity" in q was a Cartesian coordinate, it would be the angular velocity if q was an angle, and it would be some kind of "generalized velocity" otherwise.


We're ready to prove that the Euler-Lagrange equation reduces to Newton's laws in the case of a point particle. We'll use ordinary Cartesian coordinates. Its really simple -- blink and you'll miss it. Start on the LHS: the Lagrangian $$L = T - U$$, differentiate that with respect to velocity. PE doesn't depend on velocity, be KE does. $$T = 1/2 mv^2$$, so $$\frac{\partial L}{\partial v} = mv$$. The velocity derivative of kinetic energy is momentum. Great, the LHS is $$\frac{dp}{dt}$$. On the right hand side, we have $$\frac{\partial L}{\partial q}$$. KE does not depend on where we are, so this only depends on potential energy. Lets assume we're dealing with gravity, $$U = mgy$$, and our coordinate $$q$$ is $$y$$, so $$\frac{\partial U}{\partial y} = mg$$, which is the force of gravity! We're done. $$\frac{dp}{dt} = mg$$. That is newton's second law. 

$$\frac{dp}{dt} = mg$$, assuming constant mass, equals $$m \frac{dv}{dt} = ma$$, which you may be more familiar with, but the general form of newton's second law is $$F = \frac{dp}{dt} $$, which the Euler-Lagrange equation reduces to.

That logic for the RHS is true in general -- force equals the spatial derivative of potential energy. Look back at the definition of work if you're surprised by that -- force is the time derivative of momentum, and the spatial derivative of potential energy. 

We now know what lagrangian mechanics is, so it should be fairly obvious what "standard model Lagrangian" means. Its the Lagrangian for the standard model!

<img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.MD-oNuyzg9kbCEhCPyuWqAHaFh%26pid%3DApi&f=1" alt="Standard Model of Quantum Mechanics"/>

For each particle in that model, you take it, you calculate its kinetic energy and the potential energy of any forces it experiences (the standard model includes the electromagnetic forces, weak nuclear force, and the strong nuclear force), and you just plop it into the big equation, and that's basically it.

Now to understand what the actual bits all mean.... Well that's quantum mechanics and I don't understand any of it, but I do really like [this guy's MIT lectures](https://www.youtube.com/watch?v=lZ3bPUKo5zc&list=PLUl4u3cNGP61-9PEhRognw5vryrSEVLPr) on the subject, and I'd encourage you to watch the first one (it doesn't have any math, its actually just a bunch of really fun puzzles trying to wrap your head around what's happening).

