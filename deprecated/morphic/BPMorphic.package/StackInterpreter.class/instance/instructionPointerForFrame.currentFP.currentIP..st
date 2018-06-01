frame access
instructionPointerForFrame: spouseFP currentFP: currentFP currentIP: instrPtr 
	"Answer the bytecode pc object (i.e. SmallInteger) for an active frame.
	The bytecode
	pc is derived from the frame's pc. If the frame is the top frame on the
	current stack
	the frame pc is whatever the current instruction pointer is. If the
	frame is the top
	frame on some other stack the frame pc is the value on top of stack.
	Otherwise the
	frame pc is the saved pc of the frame above. Once the frame pc is
	found it must be
	mapped to a bytecode pc."
	| _gsSqueakTemp_theIP _gsSqueakTemp_thePage _gsSqueakTemp_theFPAbove |
	spouseFP = currentFP
		ifTrue: [_gsSqueakTemp_theIP := self oopForPointer: instrPtr]
		ifFalse: [_gsSqueakTemp_thePage := stackPages stackPageFor: spouseFP.
			_gsSqueakTemp_theFPAbove := self findFrameAbove: spouseFP inPage: _gsSqueakTemp_thePage.
			_gsSqueakTemp_theIP := _gsSqueakTemp_theFPAbove = 0
						ifTrue: [stackPages longAt: _gsSqueakTemp_thePage headSP]
						ifFalse: [self
								oopForPointer: (self frameCallerSavedIP: _gsSqueakTemp_theFPAbove)]].
	^ self contextInstructionPointer: _gsSqueakTemp_theIP frame: spouseFP