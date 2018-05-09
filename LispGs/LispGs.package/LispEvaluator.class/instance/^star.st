LISP-primitives
* aConsCell 
	"(* &rest NUMBERS)
	Return the product of any number of NUMBERS, even 0"
	| mul |
	mul := 1.
	(aConsCell
		ifNil: [^ 1])
		do: [:each | 
			(each isNumber
					or: [each isComplex])
				ifFalse: [self lispError: 'Number expected'].
			mul := mul * each].
	^ mul
