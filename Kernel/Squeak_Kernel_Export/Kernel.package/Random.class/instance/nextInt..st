accessing
nextInt: anInteger
	"Answer a random integer value from the interval [1, anInteger]"

	| bucketSize retriesLeft |
	anInteger strictlyPositive ifFalse: [ self error: 'Range must be positive' ].
	(anInteger isLarge 
		or: [ anInteger > MTwordMask "In case SmallIntegers have more than MTw-bits, but the generator hasn't been updated accordingly." ]) 
		ifTrue: [ ^self nextLargeInt: anInteger ].
	"Split the MTw-bit(currently 30-bit) integer range up to the equal sized buckets. Generate an MTw-bit random number, and see which bucket it's in. If it doesn't fit in any bucket, then try again."
	bucketSize := MTwordMask // anInteger. "The optimal bucket size would be MTwordMask + 1 // anInteger, but calculating it would involve LargeInteger arithmetic. The MTwordMask // anInteger expression is suboptimal only when anInteger is a power of two. These cases are rare, and the effect is negligible for small values. We could handle these cases separately, but testing if anInteger is a power of two costs more in general."
	retriesLeft := 10. "Based on measurements with various seeds, 10 retries is about optimal for the worst case, when anInteger = MTwordMask // 2 + 1."
	[ (retriesLeft := retriesLeft - 1) >= 0 ] whileTrue: [
		| bucket |
		bucket := self nextValue // bucketSize.
		bucket < anInteger ifTrue: [ ^bucket + 1 ] ].
	"Fall back to the floating point method, which is slower, but when we get here, then we've already spent enough resources on trying to generate the number. Using this fallback also ensures that the method doesn't run for indefinitely long."
	^(self next * anInteger) truncated + 1