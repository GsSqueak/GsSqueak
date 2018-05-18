accessing
peekBack
	"Return the element at the previous position, without changing position.  Use indirect messages in case self is a StandardFileStream."

	| element |
	self position = 0 ifTrue: [self errorCantGoBack].
	self position = 1 ifTrue: [self position: 0.  ^ nil].
	self skip: -2.
	element := self next.
	self skip: 1.
	^ element