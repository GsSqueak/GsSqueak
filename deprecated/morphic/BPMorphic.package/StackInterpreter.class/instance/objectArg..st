plugin primitive support
objectArg: index 
	"Like #stackObjectValue: but access method arguments left-to-right"
	"Obsolete; was never used; replaced with methodReturnFloat: in the
	VirtualMachine struct."
	| _gsSqueakTemp_oop |
	self deprecated.
	_gsSqueakTemp_oop := self methodArg: index.
	_gsSqueakTemp_oop = 0
		ifTrue: [^ 0].
	"methodArg: failed"
	(objectMemory isImmediate: _gsSqueakTemp_oop)
		ifTrue: [self primitiveFail.
			^ nil].
	^ _gsSqueakTemp_oop