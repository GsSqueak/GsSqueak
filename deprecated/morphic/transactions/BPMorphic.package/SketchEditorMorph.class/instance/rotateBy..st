actions & preps
rotateBy: evt 
	"Left-right is rotation. 3/26/97 tk Slider at top of window. 4/3/97 tk"
	| _gsSqueakTemp_pt _gsSqueakTemp_temp _gsSqueakTemp_amt _gsSqueakTemp_smooth _gsSqueakTemp_myBuff |
	_gsSqueakTemp_myBuff := self get: #buff for: evt.
	evt cursorPoint x - self left < 20
		ifTrue: [^ self flipHoriz: evt].
	"at left end flip horizontal"
	evt cursorPoint x - self right > -20
		ifTrue: [^ self flipVert: evt].
	"at right end flip vertical"
	_gsSqueakTemp_pt := evt cursorPoint - bounds center.
	_gsSqueakTemp_smooth := 2.
	"paintingForm depth > 8 ifTrue: [2] ifFalse: [1]."
	"Could go back to 1 for speed"
	_gsSqueakTemp_amt := _gsSqueakTemp_pt x abs < 12
				ifTrue: ["detent"
					0]
				ifFalse: [_gsSqueakTemp_pt x - (12 * _gsSqueakTemp_pt x abs // _gsSqueakTemp_pt x)].
	_gsSqueakTemp_amt := _gsSqueakTemp_amt * 1.8.
	_gsSqueakTemp_temp := _gsSqueakTemp_myBuff
				rotateBy: _gsSqueakTemp_amt
				magnify: cumMag
				smoothing: _gsSqueakTemp_smooth.
	_gsSqueakTemp_temp displayOn: paintingForm at: paintingForm center - _gsSqueakTemp_temp center + _gsSqueakTemp_myBuff offset.
	rotationButton position: evt cursorPoint x - 6 @ rotationButton position y.
	self render: bounds.
	cumRot := _gsSqueakTemp_amt