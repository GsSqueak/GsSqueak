layout
layout: oldBounds in: newBounds 
	"Return the proportional rectangle insetting the given bounds"
	| _gsSqueakTemp_left _gsSqueakTemp_right _gsSqueakTemp_top _gsSqueakTemp_bottom |
	leftFraction
		ifNotNil: [_gsSqueakTemp_left := newBounds left + (newBounds width * leftFraction).
			leftOffset
				ifNotNil: [_gsSqueakTemp_left := _gsSqueakTemp_left + leftOffset]].
	rightFraction
		ifNotNil: [_gsSqueakTemp_right := newBounds right - (newBounds width * (1.0 - rightFraction)).
			rightOffset
				ifNotNil: [_gsSqueakTemp_right := _gsSqueakTemp_right + rightOffset]].
	topFraction
		ifNotNil: [_gsSqueakTemp_top := newBounds top + (newBounds height * topFraction).
			topOffset
				ifNotNil: [_gsSqueakTemp_top := _gsSqueakTemp_top + topOffset]].
	bottomFraction
		ifNotNil: [_gsSqueakTemp_bottom := newBounds bottom - (newBounds height * (1.0 - bottomFraction)).
			bottomOffset
				ifNotNil: [_gsSqueakTemp_bottom := _gsSqueakTemp_bottom + bottomOffset]].
	_gsSqueakTemp_left
		ifNil: [_gsSqueakTemp_right
				ifNil: [_gsSqueakTemp_left := oldBounds left.
					_gsSqueakTemp_right := oldBounds right]
				ifNotNil: [_gsSqueakTemp_left := _gsSqueakTemp_right - oldBounds width]].
	_gsSqueakTemp_right
		ifNil: [_gsSqueakTemp_right := _gsSqueakTemp_left + oldBounds width].
	_gsSqueakTemp_top
		ifNil: [_gsSqueakTemp_bottom
				ifNil: [_gsSqueakTemp_top := oldBounds top.
					_gsSqueakTemp_bottom := oldBounds bottom]
				ifNotNil: [_gsSqueakTemp_top := _gsSqueakTemp_bottom - oldBounds height]].
	_gsSqueakTemp_bottom
		ifNil: [_gsSqueakTemp_bottom := _gsSqueakTemp_top + oldBounds height].
	^ _gsSqueakTemp_left rounded @ _gsSqueakTemp_top rounded corner: _gsSqueakTemp_right rounded @ _gsSqueakTemp_bottom rounded