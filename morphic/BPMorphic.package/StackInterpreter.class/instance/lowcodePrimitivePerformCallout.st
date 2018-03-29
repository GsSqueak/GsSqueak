inline primitive generated code
lowcodePrimitivePerformCallout
	"Lowcode instruction generator"
	| _gsSqueakTemp_function |
	_gsSqueakTemp_function := extA.
	self
		lowcodeDoCallout: (self cCoerce: _gsSqueakTemp_function to: #'char*').
	extA := 0