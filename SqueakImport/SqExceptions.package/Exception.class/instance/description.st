printing
description
	"Return a textual description of the exception."

	| desc mt |
	desc := self class name asString.
	^(mt := self messageText) == nil
		ifTrue: [desc]
		ifFalse: [desc, ': ', mt]