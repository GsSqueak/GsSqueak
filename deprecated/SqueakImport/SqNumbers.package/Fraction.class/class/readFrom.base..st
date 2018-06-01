instance creation
readFrom: stringOrStream base: aRadix
	"Answer a Fraction as described on aStream. 
	The Fraction may be specified as numerator/denominator, or just with numerator.
	Both numerator and denominator can have an exponent, but only numerator can have a sign."
	
	^(ExtendedNumberParser on: stringOrStream) nextFractionBase: aRadix