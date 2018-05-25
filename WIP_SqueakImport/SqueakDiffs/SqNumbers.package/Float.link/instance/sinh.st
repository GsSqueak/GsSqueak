*SqNumbers-mathematical functions
sinh
	"Answer receivers hyperbolic sine"
	
	| ex |
	ex := self abs exp.
	^self copySignTo: (ex - ex reciprocal) / 2
