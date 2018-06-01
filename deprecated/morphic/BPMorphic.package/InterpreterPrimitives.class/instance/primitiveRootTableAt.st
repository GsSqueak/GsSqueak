memory space primitives
primitiveRootTableAt
	"Primitive. Answer the nth element of the root table.
	This primitive avoids the creation of an extra array;
	it is intended for enumerations of the form:
	index := 1.
	[root := Smalltalk rootTableAt: index.
	root == nil] whileFalse:[index := index + 1].
	"
	| _gsSqueakTemp_index |
	_gsSqueakTemp_index := self stackIntegerValue: 0.
	self
		success: (_gsSqueakTemp_index > 0
				and: [_gsSqueakTemp_index <= objectMemory rootTableCount]).
	self successful
		ifTrue: [self pop: argumentCount + 1.
			self
				push: (objectMemory rootTable at: _gsSqueakTemp_index)]