as yet unclassified
description
	"Return a textual description of the exception."

	| desc mt |
	desc := 'Error'.
	^(mt := self messageText) == nil
		ifTrue: [desc]
		ifFalse: [desc, ': ', mt]