read, write, position
peek
	"Answer what would be returned if the message next were sent to the receiver. If the receiver is at the end, answer nil."
	
	| next |
	next := self basicNext ifNil: [ ^nil ].
	collection ifNotNil: [
		"#basicNext ensures that this is enough"
		position := position - 1.
		^next ].
	self skip: -1.
	^next