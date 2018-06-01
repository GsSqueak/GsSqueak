layout
minWidthFrom: minWidth 
	"Return the minimal extent the given bounds can be represented in"
	| _gsSqueakTemp_width _gsSqueakTemp_left _gsSqueakTemp_right |
	_gsSqueakTemp_left := leftFraction
				ifNil: [0.0].
	_gsSqueakTemp_right := rightFraction
				ifNil: [1.0].
	_gsSqueakTemp_width := _gsSqueakTemp_left = _gsSqueakTemp_right
				ifTrue: [0]
				ifFalse: [minWidth / (_gsSqueakTemp_right - _gsSqueakTemp_left)].
	leftOffset
		ifNotNil: [_gsSqueakTemp_width := _gsSqueakTemp_width + leftOffset].
	rightOffset
		ifNotNil: [_gsSqueakTemp_width := _gsSqueakTemp_width + rightOffset].
	^ _gsSqueakTemp_width truncated