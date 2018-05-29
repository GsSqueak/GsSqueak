context stack (message list)
fullyExpandStack
	"Expand the stack to include all of it, rather than the first four or five contexts.
	Well, almost all of it, we better maintain sane limits too."

	self okToChange ifFalse: [^ self].
	self newStack: (self contextStackTop stackOfSize: contextStack size + 100000).
	self changed: #contextStackList