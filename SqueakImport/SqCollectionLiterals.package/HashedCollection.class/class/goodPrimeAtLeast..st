*SqCollectionLiterals-*SqCollectionLiterals-sizing
goodPrimeAtLeast: lowerLimit
	"Answer the next good prime >= lowerlimit.
	If lowerLimit is larger than the largest known good prime,
	just make it odd."
	
	| primes low mid high prime |
	primes := self goodPrimes.
	low := 1.
	high := primes size.
	lowerLimit > (primes at: high) ifTrue: [
		^lowerLimit bitOr: 1 ].
	[ high - low <= 1 ] whileFalse: [
		mid := high + low // 2.
		prime := primes at: mid.
		prime = lowerLimit ifTrue: [ ^prime ].
		prime < lowerLimit
			ifTrue: [ low := mid ]
			ifFalse: [ high := mid ] ].
	(primes at: low) >= lowerLimit ifTrue: [ ^primes at: low ].
	^primes at: high
