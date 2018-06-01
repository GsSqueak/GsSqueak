parsing-public
nextInteger
	"Read an Integer from sourceStream, asnwser that Integer.
	This is a generic version dealing with an optional sign and a simple sequence of decimal digits.
	Subclass might define extended syntax."
	
	base := 10.
	^self nextIntegerBase: base ifFail: [^self expected: ('a digit between 0 and ' copyWith: (Character digitValue: base - 1))]