prime numbers
primesUpTo: max do: aBlock
	"Compute aBlock with all prime integers up to the given integer."
	"Integer primesUpTo: 100"

	| index sieve increment limit limitSqrtFloor |
	limit := max asInteger.
	"Fall back into #largePrimesUpTo:do: if we'd require more than 100k of memory; 
	the alternative will only requre 2/77th of the amount we need here and is almost as fast."
	limit <= 100000 ifFalse: [ ^self largePrimesUpTo: limit do: aBlock ].
	limit := limit - 1. "upTo:"
	limit <= 1 ifTrue: [ ^self ].
	aBlock value: 2.
	limit <= 2 ifTrue: [ ^self ].
	aBlock value: 3.
	sieve := ByteArray new: limit withAll: 1. "1 = prime, 0 = not prime"
	sieve at: 1 put: 0.
	"Filter multiples of 2."
	index := 4.
	[ index <= limit ] whileTrue: [
		sieve at: index put: 0.
		index := index + 2 ].
	"Filter multiples of 3."
	index := 9.
	[ index <= limit ] whileTrue: [
		sieve at: index put: 0.
		index := index + 3 ].
	"Filter the rest of the primes."
	limitSqrtFloor := limit sqrtFloor.
	index := 5.
	increment := 2.
	[ index <= limitSqrtFloor ] whileTrue: [
		(sieve at: index) = 1 ifTrue: [
			| originalIndex originalIncrement |
			aBlock value: index.
			originalIndex := index.
			originalIncrement := increment.
			increment := index + index.
			index := index * index.
			[ index <= limit ] whileTrue: [
				sieve at: index put: 0.
				index := index + increment ].
			index := originalIndex.
			increment := originalIncrement ].
		index := index + increment.
		increment := 6 - increment ].
	"No more new primes here."
	[ index <= limit ] whileTrue: [
		(sieve at: index) = 1 ifTrue: [
			aBlock value: index ].
		index := index + increment.
		increment := 6 - increment ]