instance creation
readFrom: stringOrStream 
	"Answer a fraction as described on aStream. 
	The fraction may be specified as numerator/denominator, or just a numerator, or as integerPart.fractionPart.
	In numerator/denominator form, both parts may have a radix specification and an exponent, but only numerator can have a sign.
	In fractional digits form, an alternate radix and an exponent can also be provided, the integer or fraction part being optional."
	
	^(ExtendedNumberParser on: stringOrStream) nextFraction