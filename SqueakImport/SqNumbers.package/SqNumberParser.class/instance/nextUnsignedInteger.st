parsing-public
nextUnsignedInteger
	"Read an unsigned Integer from sourceStream, asnwser that Integer.
	In Smalltalk syntax, a radix can be specified, and an exponent too."
	
	base := 10.
	neg := false.
	integerPart := self nextUnsignedIntegerOrNilBase: base.
	(sourceStream peekFor: $r)
		ifTrue: ["<base>r<integer>"
			(base := integerPart) < 2
				ifTrue: [
					sourceStream skip: -1.
					^ self expected: 'an integer greater than 1 as valid radix'].
			integerPart := self nextUnsignedIntegerBase: base].
	^ self makeIntegerOrScaledInteger