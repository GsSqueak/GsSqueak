handles
addDupHandle: haloSpec
	"Add the halo that offers duplication, or, when shift is down, make-sibling"

 	| aSelector |
	aSelector := innerTarget couldMakeSibling
		ifTrue:
			[#doDupOrMakeSibling:with:]
		ifFalse:
			[#doDup:with:].

	self addHandle: haloSpec on: #mouseDown send: aSelector to: self

