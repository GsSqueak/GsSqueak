other
setAALevel: level 
	"Set the anti-aliasing level. Three levels are supported:
	1 - No antialiasing
	2 - 2x2 unweighted anti-aliasing
	4 - 4x4 unweighted anti-aliasing.
	"
	| _gsSqueakTemp_aaLevel |
	level >= 4
		ifTrue: [_gsSqueakTemp_aaLevel := 4].
	level >= 2 & (level < 4)
		ifTrue: [_gsSqueakTemp_aaLevel := 2].
	level < 2
		ifTrue: [_gsSqueakTemp_aaLevel := 1].
	self aaLevelPut: _gsSqueakTemp_aaLevel.
	_gsSqueakTemp_aaLevel = 1
		ifTrue: [self aaShiftPut: 0.
			self aaColorMaskPut: 4294967295.
			self aaScanMaskPut: 0].
	_gsSqueakTemp_aaLevel = 2
		ifTrue: [self aaShiftPut: 1.
			self aaColorMaskPut: 4244438268.
			self aaScanMaskPut: 1].
	_gsSqueakTemp_aaLevel = 4
		ifTrue: [self aaShiftPut: 2.
			self aaColorMaskPut: 4042322160.
			self aaScanMaskPut: 3].
	self aaColorShiftPut: self aaShiftGet * 2.
	self aaHalfPixelPut: self aaShiftGet