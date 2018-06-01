Fraction provides methods for dealing with fractions like 1/3 as a ratio of two integers (as apposed to a decimal representation 0.33333...).

instance variables:
	numerator	<Integer> the number appearing before the fraction bar (above)
	denominator	<Integer> the number appearing after the fraction bar (below)
		
A Fraction is generally created by sending the message / to an Integer, like in

    1 / 3

Alternatively, it is possible to create a new instance of Fraction by sending #numerator:denominator: to the class.
In this later case, it is then user responsibility to ensure that it conforms to the following invariants:

- the denominator shall allways be positive.
  A negative Fraction shall have a negative numerator, never a negative denominator.
  Example: 1 / -3 will return -1/3
- the denominator shall allways be greater than 1.
  A Fraction with denominator 1 shall be reduced to its numerator (an Integer).
  Example 3 / 1 will answer 3 (the Integer) not 3/1
- the numerator and denominator shall never have common multiples.
  Common multiples shall allways be simplified until (numerator gcd: denominator) = 1.
  Example 8 / 6 will answer 4 / 3, because both 8=2*4 and 6=2*3 are both divisible by 2.

A Fraction non conforming to above invariants could be the cause of undefined behavior and unexpected results.
If unsure, it is advised to send the message #reduced to the freshly created instance so as to obtain a conforming Fraction, or an Integer.

Note that Fraction and Integer represent together the set of Rational numbers:
- Integer is a subset of rational (those which are whole numbers)
- Fraction is used for representing the complementary subset of rational (those which are not whole numbers)

There could have been a Rational superclass to both Integer and Fraction, and a message #isRational for testing if a Number is a Rational, as well as a message #asRational for converting a Number to a Rational.
But this level of indirection is not strictly necessary: instead, the notion of Rational and Fraction are collapsed in Squeak, and Integer are considered as a sort of special Fraction with unitary denominator.
Thus #isFraction is the testing message, to which every Integer will also answer true, since considered as a sort of Fraction.
And #asFraction is the conversion message, that may answer an instance of Fraction or Integer, depending if the corresponding rational number is whole or not.

All public arithmetic operations will answer reduced fractions.
Examples:

(2/3) + (2/3)
(2/3) + (1/2)		"case showing reduction to common denominator" 
(2/3) + (4/3)		"case where result is reduced to an Integer"
(2/3) raisedToInteger: 5		 "fractions also can be exponentiated"
