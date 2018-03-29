plugin primitive support
integerArg: index 
	"Like #stackIntegerValue: but access method arguments left-to-right"
	"Obsolete; was never used; replaced with methodReturnInteger: in the
	VirtualMachine struct."
	| _gsSqueakTemp_oop |
	self deprecated.
	_gsSqueakTemp_oop := self methodArg: index.
	_gsSqueakTemp_oop = 0
		ifTrue: [^ 0].
	"methodArg: failed"
	^ self checkedIntegerValueOf: _gsSqueakTemp_oop