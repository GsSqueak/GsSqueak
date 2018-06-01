actions & preps
scaleBy: evt 
	"up-down is scale. 3/26/97 tk Now a slider on the right."
	| _gsSqueakTemp_pt _gsSqueakTemp_temp _gsSqueakTemp_cy _gsSqueakTemp_oldRect _gsSqueakTemp_amt _gsSqueakTemp_myBuff |
	_gsSqueakTemp_myBuff := self get: #buff for: evt.
	_gsSqueakTemp_pt := evt cursorPoint - bounds center.
	_gsSqueakTemp_cy := bounds height * 0.5.
	_gsSqueakTemp_oldRect := _gsSqueakTemp_myBuff boundingBox expandBy: _gsSqueakTemp_myBuff extent * cumMag / 2.
	_gsSqueakTemp_amt := _gsSqueakTemp_pt y abs < 12
				ifTrue: ["detent"
					1.0]
				ifFalse: [_gsSqueakTemp_pt y - (12 * _gsSqueakTemp_pt y abs // _gsSqueakTemp_pt x)].
	_gsSqueakTemp_amt := _gsSqueakTemp_amt asFloat / _gsSqueakTemp_cy + 1.0.
	_gsSqueakTemp_temp := _gsSqueakTemp_myBuff
				rotateBy: cumRot
				magnify: _gsSqueakTemp_amt
				smoothing: 2.
	cumMag > _gsSqueakTemp_amt
		ifTrue: ["shrinking"
			_gsSqueakTemp_oldRect := _gsSqueakTemp_oldRect translateBy: paintingForm center - _gsSqueakTemp_oldRect center + _gsSqueakTemp_myBuff offset.
			paintingForm
				fill: (_gsSqueakTemp_oldRect expandBy: 1 @ 1)
				rule: Form over
				fillColor: Color transparent].
	_gsSqueakTemp_temp displayOn: paintingForm at: paintingForm center - _gsSqueakTemp_temp center + _gsSqueakTemp_myBuff offset.
	scaleButton position: scaleButton position x @ (evt cursorPoint y - 6).
	self render: bounds.
	cumMag := _gsSqueakTemp_amt