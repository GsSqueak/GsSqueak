misc
overlaps: aPlayer 
	"Answer whether my costume overlaps that of another player"
	| _gsSqueakTemp_goalCostume _gsSqueakTemp_intersection _gsSqueakTemp_myShadow _gsSqueakTemp_goalShadow _gsSqueakTemp_bb _gsSqueakTemp_myRect _gsSqueakTemp_goalRect |
	aPlayer
		ifNil: [^ false].
	_gsSqueakTemp_goalCostume := aPlayer costume.
	costume world == _gsSqueakTemp_goalCostume world
		ifFalse: [^ false].
	"check if the 2 player costumes intersect"
	_gsSqueakTemp_intersection := costume bounds intersect: _gsSqueakTemp_goalCostume bounds.
	(_gsSqueakTemp_intersection width = 0
			or: [_gsSqueakTemp_intersection height = 0])
		ifTrue: [^ false]
		ifFalse: ["check if the overlapping region is non-transparent"
			"compute 1-bit, black and white versions (stencils) of the
			intersecting 
			part of each morph's costume"
			_gsSqueakTemp_myRect := _gsSqueakTemp_intersection translateBy: 0 @ 0 - costume topLeft.
			_gsSqueakTemp_myShadow := (costume imageForm contentsOfArea: _gsSqueakTemp_myRect) stencil.
			_gsSqueakTemp_goalRect := _gsSqueakTemp_intersection translateBy: 0 @ 0 - _gsSqueakTemp_goalCostume topLeft.
			_gsSqueakTemp_goalShadow := (_gsSqueakTemp_goalCostume imageForm contentsOfArea: _gsSqueakTemp_goalRect) stencil.
			"compute a pixel-by-pixel AND of the two stencils. Result will
			be black 
			(pixel value = 1) where black parts of the stencils overlap"
			_gsSqueakTemp_bb := BitBlt toForm: _gsSqueakTemp_myShadow.
			_gsSqueakTemp_bb
				copyForm: _gsSqueakTemp_goalShadow
				to: 0 @ 0
				rule: Form and.
			"return TRUE if resulting form contains any black pixels"
			^ _gsSqueakTemp_bb destForm tallyPixelValues second > 0]