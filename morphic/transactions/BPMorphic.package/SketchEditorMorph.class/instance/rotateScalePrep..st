actions & preps
rotateScalePrep: evt 
	"Make a source that is the paintingForm. Work from that. 3/26/97 tk"
	| _gsSqueakTemp_newBox _gsSqueakTemp_myBuff |
	(self getActionFor: evt)
			== #scaleOrRotate
		ifTrue: [^ self].
	"Already doing it"
	paintingForm width > 120
		ifTrue: [_gsSqueakTemp_newBox := paintingForm rectangleEnclosingPixelsNotOfColor: Color transparent.
			"minimum size"
			_gsSqueakTemp_newBox := _gsSqueakTemp_newBox insetBy: (18 - _gsSqueakTemp_newBox width max: 0)
							// 2 @ ((18 - _gsSqueakTemp_newBox height max: 0)
								// 2) * -1]
		ifFalse: [_gsSqueakTemp_newBox := paintingForm boundingBox].
	_gsSqueakTemp_newBox := _gsSqueakTemp_newBox expandBy: 1.
	self
		set: #buff
		for: evt
		to: (_gsSqueakTemp_myBuff := Form extent: _gsSqueakTemp_newBox extent depth: paintingForm depth).
	_gsSqueakTemp_myBuff offset: _gsSqueakTemp_newBox center - paintingForm center.
	_gsSqueakTemp_myBuff
		copyBits: _gsSqueakTemp_newBox
		from: paintingForm
		at: 0 @ 0
		clippingBox: _gsSqueakTemp_myBuff boundingBox
		rule: Form over
		fillColor: nil.
	"Could just run up owner chain asking colorUsed, but may not be
	embedded "
	cumRot := 0.0.
	cumMag := 1.0.
	"start over"
	self
		set: #changed
		for: evt
		to: true.
	self
		set: #action
		for: evt
		to: #scaleOrRotate