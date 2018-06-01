accessing
back
	"Go back one element and return it."
	self position = 0 ifTrue: [self errorCantGoBack].
	self skip: -1.
	^ self peek