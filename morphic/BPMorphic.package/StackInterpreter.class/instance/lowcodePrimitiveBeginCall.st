inline primitive generated code
lowcodePrimitiveBeginCall
	"Lowcode instruction generator"
	| _gsSqueakTemp_alignment |
	_gsSqueakTemp_alignment := extA.
	"Store the shadow stack pointer"
	self shadowCallStackPointerIn: localFP put: shadowCallStackPointer + 1.
	"Allocate the callout state"
	self allocateLowcodeCalloutState.
	extA := 0