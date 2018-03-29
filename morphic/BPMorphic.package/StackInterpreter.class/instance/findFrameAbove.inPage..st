frame access
findFrameAbove: theFP inPage: thePage 
	"Answer the frame above theFP (adjacent frame nearest head end).
	If theFP is the head frame answer 0."
	| _gsSqueakTemp_fp _gsSqueakTemp_callerFP |
	_gsSqueakTemp_fp := thePage headFP.
	_gsSqueakTemp_fp = theFP
		ifTrue: [^ 0].
	[(_gsSqueakTemp_callerFP := self frameCallerFP: _gsSqueakTemp_fp) ~= 0]
		whileTrue: [_gsSqueakTemp_callerFP = theFP
				ifTrue: [^ _gsSqueakTemp_fp].
			_gsSqueakTemp_fp := _gsSqueakTemp_callerFP].
	self error: 'did not find theFP in stack page'.
	^ 0