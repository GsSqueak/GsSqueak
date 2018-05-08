LISP-primitives
complexP: aConsCell 
	^ self
		test: (aConsCell car isComplex
				or: [aConsCell car isNumber])".. we need the double test for Squeak 3.8 where a Complex answsers
	false to #isNumber"
