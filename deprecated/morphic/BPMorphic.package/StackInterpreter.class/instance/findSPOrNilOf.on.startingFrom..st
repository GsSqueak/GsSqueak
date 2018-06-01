frame access
findSPOrNilOf: theFP on: thePage startingFrom: startFrame 
	"Search for the stack pointer for theFP. This points to the hottest item
	on the frame's stack.
	DO NOT CALL THIS WITH theFP == localFP OR theFP ==
	framePointer! "
	| _gsSqueakTemp_aFrame _gsSqueakTemp_prevFrame |
	startFrame = theFP
		ifTrue: [thePage headSP >= startFrame
				ifTrue: ["If the SP is invalid return the pointer to the receiver
					field. "
					^ self frameReceiverLocation: theFP].
			"Skip the instruction pointer on top of stack of inactive pages."
			^ thePage = stackPage
				ifTrue: [thePage headSP]
				ifFalse: [thePage headSP + objectMemory wordSize]].
	_gsSqueakTemp_aFrame := startFrame.
	[_gsSqueakTemp_prevFrame := _gsSqueakTemp_aFrame.
	_gsSqueakTemp_aFrame := self frameCallerFP: _gsSqueakTemp_aFrame.
	_gsSqueakTemp_aFrame ~= 0]
		whileTrue: [theFP = _gsSqueakTemp_aFrame
				ifTrue: [^ self frameCallerSP: _gsSqueakTemp_prevFrame]].
	^ nil