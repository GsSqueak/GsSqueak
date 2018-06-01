inline primitive generated code
lowcodePrimitivePerformCalloutIndirect
	"Lowcode instruction generator"
	| _gsSqueakTemp_function |
	_gsSqueakTemp_function := self internalPopStackPointer.
	self lowcodeDoCallout: _gsSqueakTemp_function