*SqCollectionLiterals-accessing
numArgs 
	"Answer either the number of arguments that the receiver would take if considered a selector.  Answer -1 if it couldn't be a selector. It is intended mostly for the assistance of spelling correction."

	| numColons index size |
	(size := self size) = 0 ifTrue: [ ^-1 ].
	index := 1.
	(self at: index) isSpecial ifTrue: [
		2 to: size do: [ :i | (self at: i) isSpecial ifFalse: [ ^-1 ] ].
		^1 ].
	self canBeToken ifFalse: [ ^-1 ].
	"Fast colon count"
	numColons := 0.
	[ 
		(self at: index) isLetter ifFalse: [ ^-1 ].
		(index := (self indexOf: $: startingAt: index) + 1) > 1 ifFalse: [ 
			numColons = 0 ifTrue: [ ^0 ].
			^-1 ].
		numColons := numColons + 1.
		index <= size ] whileTrue.
	^numColons
