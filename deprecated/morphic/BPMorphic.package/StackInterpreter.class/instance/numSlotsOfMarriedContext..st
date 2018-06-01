internal interpreter access
numSlotsOfMarriedContext: aContext 
	"Answer the number of effective pointer fields in the given context."
	| _gsSqueakTemp_contextSize |
	_gsSqueakTemp_contextSize := self
				stackPointerIndexForFrame: (self frameOfMarriedContext: aContext).
	^ CtxtTempFrameStart + _gsSqueakTemp_contextSize