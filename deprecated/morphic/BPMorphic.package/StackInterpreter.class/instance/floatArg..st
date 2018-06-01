plugin primitive support
floatArg: index 
	"Like #stackFloatValue: but access method arguments left-to-right"
	"Obsolete; was never used; replaced with methodReturnString: in the
	VirtualMachine struct."
	| _gsSqueakTemp_oop |
	self deprecated.
	_gsSqueakTemp_oop := self methodArg: index.
	_gsSqueakTemp_oop = 0
		ifTrue: [^ 0.0].
	"methodArg: failed"
	^ objectMemory floatValueOf: _gsSqueakTemp_oop