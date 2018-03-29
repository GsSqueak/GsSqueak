object access primitives
primitiveChangeClass
	"Primitive. Change the class of the receiver into the class of the
	argument given that
	the format of the receiver matches the format of the argument's
	class. Fail if the
	receiver or argument are SmallIntegers, or the receiver is an instance
	of a compact
	class and the argument isn't, or when the argument's class is
	compact and the receiver
	isn't, or when the format of the receiver is different from the format of
	the argument's
	class, or when the arguments class is fixed and the receiver's size
	differs from the size
	that an instance of the argument's class should have."
	| _gsSqueakTemp_arg _gsSqueakTemp_rcvr _gsSqueakTemp_argClass _gsSqueakTemp_err |
	_gsSqueakTemp_arg := self stackObjectValue: 0.
	_gsSqueakTemp_rcvr := self stackObjectValue: 1.
	self successful
		ifFalse: [^ nil].
	_gsSqueakTemp_argClass := objectMemory fetchClassOfNonImm: _gsSqueakTemp_arg.
	_gsSqueakTemp_err := objectMemory changeClassOf: _gsSqueakTemp_rcvr to: _gsSqueakTemp_argClass.
	_gsSqueakTemp_err = 0
		ifTrue: ["Flush at cache because rcvr's class has changed."
			self flushAtCache.
			self pop: self methodArgumentCount]
		ifFalse: [self primitiveFailFor: _gsSqueakTemp_err].
	^ nil