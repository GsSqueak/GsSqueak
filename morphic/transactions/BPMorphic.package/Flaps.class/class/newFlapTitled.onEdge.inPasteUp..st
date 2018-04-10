new flap
newFlapTitled: aString onEdge: anEdge inPasteUp: aPasteUpMorph 
	"Add a flap with the given title, placing it on the given edge, in the
	given pasteup"
	| _gsSqueakTemp_aFlapBody _gsSqueakTemp_aFlapTab |
	_gsSqueakTemp_aFlapBody := PasteUpMorph newSticky.
	_gsSqueakTemp_aFlapTab := FlapTab new referent: _gsSqueakTemp_aFlapBody.
	_gsSqueakTemp_aFlapTab
		setName: aString
		edge: anEdge
		color: (Color
				r: 0.516
				g: 0.452
				b: 1.0).
	anEdge == #left
		ifTrue: [_gsSqueakTemp_aFlapTab position: aPasteUpMorph left @ aPasteUpMorph top.
			_gsSqueakTemp_aFlapBody extent: 200 @ aPasteUpMorph height].
	anEdge == #right
		ifTrue: [_gsSqueakTemp_aFlapTab position: aPasteUpMorph right - _gsSqueakTemp_aFlapTab width @ aPasteUpMorph top.
			_gsSqueakTemp_aFlapBody extent: 200 @ aPasteUpMorph height].
	anEdge == #top
		ifTrue: [_gsSqueakTemp_aFlapTab position: aPasteUpMorph left + 50 @ aPasteUpMorph top.
			_gsSqueakTemp_aFlapBody extent: aPasteUpMorph width @ 200].
	anEdge == #bottom
		ifTrue: [_gsSqueakTemp_aFlapTab position: aPasteUpMorph left + 50 @ (aPasteUpMorph bottom - _gsSqueakTemp_aFlapTab height).
			_gsSqueakTemp_aFlapBody extent: aPasteUpMorph width @ 200].
	_gsSqueakTemp_aFlapBody beFlap: true.
	_gsSqueakTemp_aFlapBody color: self defaultColorForFlapBackgrounds.
	^ _gsSqueakTemp_aFlapTab