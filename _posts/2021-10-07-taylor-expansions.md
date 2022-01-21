taylor expansions are also pretty cool
$$\sin{x} = x - \frac{x^3}{3!} + \frac{x^5}{5!} - \frac{x^7}{7!} + \dots$$ 
that's actually how your calculator calculates sin
and it turns out, you can write any function as a polynomial like that

the reason this works is that if you want to approximate a function, a good way to do that is to start and say "I want the value of the function at 0 to equal my approximation", so sin(x) = 0 
then, you say "i want the derivative of my function at 0 to equal the derivative of my approxmiation" -- since the derivative of sin is cos, and cos(0) = 1, you have sin(x) = 0 + x. convieniently, no matter what your constant terms were before the x, they'll differentiate out to zero, and your terms after the x, are all higher order, so they also become zero
then you say, "i want the second derivative (concavity) of my function at zero to equal the second derivative of my approxmation". second derivative of sin is -sin, -sin(0) = 0. but wait, there's a catch, you're making that zero the coefficient of the x^2 term, but after you apply power rule, that 2 is going to come out in front when you take the second derivative, so to compensate, you have to divide by two. so you have sin(x) = 0 + x + 0/2 * x^2
repeat for the third derivative, you have -cos(0) = -1, sin(x) = 0 + x + 0/2 x^2 + -1/(3 * 2) x^3
and so on

if you want to move it around, so its not at zero, then you just replace every x with an (x-a)

 if you know where the function is, and you know what the slope is, and you know what the concavity is, and you know what the torsion is (that's like concavity for third derivative), and so on, you basically know the function
unfortunately, it turns out there's some functions (like ln(x + 1)) where the taylor polynomial a point doesn't actually have enough "information" to graph the whole function, it's only accurate in the region -1 < x < 1 

see: https://www.desmos.com/calculator/jk39epa4kz
just turn up the a value and you can sorta see why it doesn't converge x > 1


the guy that came up with this, Brook Taylor, gets credit for it
he came up with the general form
with every x replaced by (x-a)
then, this other guy, MacLaurin comes around
and he's like "what if you had a taylor series with a = 0"
and he decides to call it a MacLaurin series
so like.... Taylor did all the hard work, came up with the whole thing, and then MacLaurin was just like "well uh... let a = 0"
and now most calc books refer to it as a maclaurin series
