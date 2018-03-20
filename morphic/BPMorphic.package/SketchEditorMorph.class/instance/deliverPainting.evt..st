start & finish
deliverPainting: result evt: evt 
	"Done painting. May come from resume, or from original call. Execute
	user's post painting instructions in the block. Always use this
	standard one. 4/21/97 tk"
	| _gsSqueakTemp_newBox _gsSqueakTemp_newForm _gsSqueakTemp_ans |
	palette
		ifNotNil: ["nil happens"
			palette setAction: #paint: evt: evt].
	"Get out of odd modes"
	"rot := palette getRotations."
	"rotate with heading, or turn to and fro"
	"palette setRotation: #normal."
	result == #cancel
		ifTrue: [_gsSqueakTemp_ans := UIManager default chooseFrom: {'throw it away' translated. 'keep painting it' translated} title: 'Do you really want to throw away 
what you just painted?' translated.
			^ _gsSqueakTemp_ans = 1
				ifTrue: [self cancelOutOfPainting]].
	"cancelled out of cancelling."
	"hostView rotationStyle: rot."
	"rotate with heading, or turn to and fro"
	_gsSqueakTemp_newBox := paintingForm rectangleEnclosingPixelsNotOfColor: Color transparent.
	registrationPoint
		ifNotNil: [registrationPoint := registrationPoint - _gsSqueakTemp_newBox origin].
	"relative to newForm origin"
	_gsSqueakTemp_newForm := Form extent: _gsSqueakTemp_newBox extent depth: paintingForm depth.
	_gsSqueakTemp_newForm
		copyBits: _gsSqueakTemp_newBox
		from: paintingForm
		at: 0 @ 0
		clippingBox: _gsSqueakTemp_newForm boundingBox
		rule: Form over
		fillColor: nil.
	_gsSqueakTemp_newForm isAllWhite
		ifTrue: [(self valueOfProperty: #background)
					== true
				ifFalse: [^ self cancelOutOfPainting]].
	_gsSqueakTemp_newForm fixAlpha.
	"so alpha channel stays intact for 32bpp"
	self delete.
	"so won't find me again"
	dimForm
		ifNotNil: [dimForm delete].
	newPicBlock
		value: _gsSqueakTemp_newForm
		value: (_gsSqueakTemp_newBox copy translateBy: bounds origin).
	ActiveWorld resumeScriptsPausedByPainting