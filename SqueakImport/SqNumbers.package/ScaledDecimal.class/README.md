ScaledDecimal provides a numeric representation of fixed point decimal numbers able to accurately represent decimal fractions.  It supports unbounded precision, with no limit to the number of digits before and after the decimal point.
	ScaledDecimal complies with the ANSI protocols:

	Object
	number
	ScaledDecimal
	????
#todo. "finish protocol list."

Implementation Notes:

In order to fullfil exact arithmetic requirements, ScaledDecimal is implemented using a Fraction (or an Integer if fraction part is zero) in the fraction instance variable, and a positive Integer number of digits after the decimal point in the scale instance variable. 

A scaled decimal will perform arithmetic by coercing the arguments to fractions, and perform the operations with exact arithmetic.

Note that the denominator needs not being a power of two. If denominator has other prime factors than 2 and 5, then it cannot be printed in decimal form with a finite number of digits. Instead, the printed representation will be truncated to the number of digits prescribed in scale. But beware, the number still has hidden precision.

Example: 
| x |
x := 1 / 3.0s2.
^{ x printString -> 'truncated print'.
  3 * x -> 'but full precision'}
