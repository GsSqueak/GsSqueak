system primitives
replaceFrom: start to: stop with: replacement startingAt: repStart 
	"Primitive. This destructively replaces elements from start to stop in the receiver starting at index, repStart, in the collection, replacement. Answer the receiver. Range checks are performed in the primitive only. Optional. See Object documentation whatIsAPrimitive."

	| index replacementIndex |
	<primitive: 105>
	replacementIndex := repStart.
	index := start.
	replacement isInteger ifTrue: [
		"This branch is only here to accept SmallInteger replacements not handled by the primitive."
		[ index <= stop ] whileTrue: [
			self digitAt: index put: (replacement digitAt: replacementIndex).
			index := index + 1.
			replacementIndex := replacementIndex + 1 ].
		^self ].
	"Primitive compatible variant which doesn't support SmallInteger replacements."
	[ index <= stop ] whileTrue: [
		self basicAt: index put: (replacement basicAt: replacementIndex).
		index := index + 1.
		replacementIndex := replacementIndex + 1 ]