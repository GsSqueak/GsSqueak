as yet unclassified
derivedFrom: aForm 
	"Cursor initNormalWithMask. Cursor normal show"
	"aForm is presumably a cursor"
	| _gsSqueakTemp_cursor _gsSqueakTemp_mask _gsSqueakTemp_ext |
	_gsSqueakTemp_ext := aForm extent.
	_gsSqueakTemp_cursor := self extent: _gsSqueakTemp_ext.
	_gsSqueakTemp_cursor
		copy: (1 @ 1 extent: _gsSqueakTemp_ext)
		from: 0 @ 0
		in: aForm
		rule: Form over.
	_gsSqueakTemp_mask := Form extent: _gsSqueakTemp_ext.
	(1 @ 1) eightNeighbors
		do: [:p | _gsSqueakTemp_mask
				copy: (p extent: _gsSqueakTemp_ext)
				from: 0 @ 0
				in: aForm
				rule: Form under].
	_gsSqueakTemp_cursor setMaskForm: _gsSqueakTemp_mask.
	_gsSqueakTemp_cursor
		offset: (aForm offset - (1 @ 1) max: _gsSqueakTemp_ext negated).
	^ _gsSqueakTemp_cursor