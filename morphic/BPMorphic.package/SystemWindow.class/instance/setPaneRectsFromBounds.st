geometry
setPaneRectsFromBounds
	"Reset proportional specs from actual bounds, eg, after reframing
	panes "
	| _gsSqueakTemp_layoutBounds |
	_gsSqueakTemp_layoutBounds := self layoutBounds.
	paneMorphs
		do: [:m | 
			| box left bottom top frame right |
			frame := m layoutFrame.
			box := m bounds.
			frame
				ifNotNil: [left := box left - _gsSqueakTemp_layoutBounds left
								- (frame leftOffset
										ifNil: [0]).
					right := box right - _gsSqueakTemp_layoutBounds left
								- (frame rightOffset
										ifNil: [0]).
					top := box top - _gsSqueakTemp_layoutBounds top
								- (frame topOffset
										ifNil: [0]).
					bottom := box bottom - _gsSqueakTemp_layoutBounds top
								- (frame bottomOffset
										ifNil: [0]).
					frame leftFraction: left / _gsSqueakTemp_layoutBounds width asFloat.
					frame rightFraction: right / _gsSqueakTemp_layoutBounds width asFloat.
					frame topFraction: top / _gsSqueakTemp_layoutBounds height asFloat.
					frame bottomFraction: bottom / _gsSqueakTemp_layoutBounds height asFloat]]