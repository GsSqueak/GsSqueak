actions & preps
showDirType
	"Display the proper symbol for this direction type. rotationStyle
	is one of #(normal leftRight upDown none)."
	| _gsSqueakTemp_rr _gsSqueakTemp_poly |
	_gsSqueakTemp_rr := self rotationStyle.
	_gsSqueakTemp_poly := self valueOfProperty: #fwdButton.
	_gsSqueakTemp_rr == #normal
		ifTrue: [^ _gsSqueakTemp_poly makeBackArrow].
	_gsSqueakTemp_rr == #leftRight
		ifTrue: [_gsSqueakTemp_poly makeBothArrows.
			^ _gsSqueakTemp_poly
				setVertices: (Array with: _gsSqueakTemp_poly center - (7 @ 0) with: _gsSqueakTemp_poly center + (7 @ 0))].
	_gsSqueakTemp_rr == #upDown
		ifTrue: [_gsSqueakTemp_poly makeBothArrows.
			^ _gsSqueakTemp_poly
				setVertices: (Array with: _gsSqueakTemp_poly center - (0 @ 7) with: _gsSqueakTemp_poly center + (0 @ 7))].
	_gsSqueakTemp_rr == #none
		ifTrue: [_gsSqueakTemp_poly makeNoArrows.
			^ _gsSqueakTemp_poly
				setVertices: (Array
						with: _gsSqueakTemp_poly center - (7 @ 0)
						with: _gsSqueakTemp_poly center + (7 @ 0)
						with: _gsSqueakTemp_poly center
						with: _gsSqueakTemp_poly center - (0 @ 7)
						with: _gsSqueakTemp_poly center + (0 @ 7))]