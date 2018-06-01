frame access
ensureCallerContext: theFP 
	"Answerr the caller context for a frame. If the frame has a caller
	frame that doesn't have a context, then marry the caller frame."
	| _gsSqueakTemp_callerFP |
	_gsSqueakTemp_callerFP := self frameCallerFP: theFP.
	_gsSqueakTemp_callerFP = 0
		ifTrue: ["base frame, context in saved ip slot (or base of stack in Cog)"
			^ self frameCallerContext: theFP].
	^ self
		ensureFrameIsMarried: _gsSqueakTemp_callerFP
		SP: (self frameCallerStackPointer: theFP)