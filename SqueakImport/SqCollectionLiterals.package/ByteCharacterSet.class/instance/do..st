enumerating
do: aBlock
	"evaluate aBlock with each character in the set"

	| index |
	tally >= 128 ifTrue: [ "dense"
		index := 0.
		[ (index := index + 1) <= 256 ] whileTrue: [
			(byteArrayMap at: index) = 1 ifTrue: [
				aBlock value: (Character value: index - 1) ] ].
		^self ].
	"sparse"
	index := 0.
	[ (index := byteArrayMap indexOf: 1 startingAt: index + 1) = 0 ] whileFalse: [
		aBlock value: (Character value: index - 1) ].
	
