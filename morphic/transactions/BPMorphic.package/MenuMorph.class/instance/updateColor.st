control
updateColor
	| _gsSqueakTemp_fill _gsSqueakTemp_title _gsSqueakTemp_cc |
	self class gradientMenu
		ifFalse: [^ self].
	(self fillStyle == self color) not
		ifTrue: [^ self].
	"Don't apply the gradient more than once"
	""
	_gsSqueakTemp_title := self allMorphs
				detect: [:each | each hasProperty: #titleString]
				ifNone: [].
	_gsSqueakTemp_cc := self color adjustSaturation: -0.08 brightness: 0.4.
	_gsSqueakTemp_fill := GradientFillStyle ramp: {0.0
					-> (_gsSqueakTemp_title
							ifNil: [_gsSqueakTemp_cc]
							ifNotNil: [_gsSqueakTemp_cc muchLighter]). 0.25
					-> (self color mixed: 0.5 with: _gsSqueakTemp_cc). 1.0 -> self color}.
	""
	_gsSqueakTemp_fill radial: false;
		 origin: self topLeft;
		 direction: 0 @ self height.
	""
	"
	update the title color"
	_gsSqueakTemp_title
		ifNotNil: [_gsSqueakTemp_fill direction: 0 @ _gsSqueakTemp_title height].
	self fillStyle: _gsSqueakTemp_fill.
	_gsSqueakTemp_title
		ifNil: [^ self].
	""
	_gsSqueakTemp_fill := GradientFillStyle ramp: {0.0 -> _gsSqueakTemp_title color twiceLighter. 1 -> _gsSqueakTemp_title color twiceDarker}.
	""
	_gsSqueakTemp_fill origin: _gsSqueakTemp_title topLeft;
		 direction: _gsSqueakTemp_title width @ 0.
	""
	_gsSqueakTemp_title fillStyle: _gsSqueakTemp_fill