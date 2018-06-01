An ExtendedNumberParser parses numbers, extending Squeak number syntax with these rules

- allow partial specification of integer and fraction parts:
1.e2 .1e3 are both 100.0
- allow plus sign before number and in exponent
- integers raised to exponents, the results of which are fractional, are answered as Fractions, not Floats
