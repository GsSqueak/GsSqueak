frame access
safeFindFrameAbove: theFP on: thePage startingFrom: startFrame 
	"Search for the previous frame to theFP (the frame that theFP calls).
	DO NOT CALL THIS WITH theFP == localFP OR theFP ==
	framePointer! "
	| _gsSqueakTemp_aFrame _gsSqueakTemp_prevFrame |
	self assert: (stackPages isFree: thePage) not.
	startFrame = theFP
		ifTrue: [^ nil].
	_gsSqueakTemp_aFrame := startFrame.
	[_gsSqueakTemp_prevFrame := _gsSqueakTemp_aFrame.
	_gsSqueakTemp_aFrame := self frameCallerFP: _gsSqueakTemp_aFrame.
	_gsSqueakTemp_aFrame ~= 0]
		whileTrue: [theFP = _gsSqueakTemp_aFrame
				ifTrue: [^ _gsSqueakTemp_prevFrame]].
	^ nil