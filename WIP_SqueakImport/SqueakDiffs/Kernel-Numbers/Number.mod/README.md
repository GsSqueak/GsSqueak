Class Number holds the most general methods for dealing with numbers. Subclasses Float, Fraction, and Integer, and their subclasses, provide concrete representations of a numeric quantity.

All of Number's subclasses participate in a simple type coercion mechanism that supports mixed-mode arithmetic and comparisons.  It works as follows:  If
	self<typeA> op: arg<typeB>
fails because of incompatible types, then it is retried in the following guise:
	(arg adaptTypeA: self) op: arg adaptToTypeA.
This gives the arg of typeB an opportunity to resolve the incompatibility, knowing exactly what two types are involved.  If self is more general, then arg will be converted, and viceVersa.  This mechanism is extensible to any new number classes that one might wish to add to Squeak.  The only requirement is that every subclass of Number must support a pair of conversion methods specific to each of the other subclasses of Number.