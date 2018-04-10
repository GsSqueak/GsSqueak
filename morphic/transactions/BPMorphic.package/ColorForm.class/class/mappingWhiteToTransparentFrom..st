as yet unclassified
mappingWhiteToTransparentFrom: aFormOrCursor 
	"Return a ColorForm copied from the given Form or Cursor with white
	mapped to transparent."
	| _gsSqueakTemp_f _gsSqueakTemp_map |
	aFormOrCursor depth <= 8
		ifFalse: [^ self error: 'argument depth must be 8-bits per pixel or less'].
	aFormOrCursor isColorForm
		ifTrue: [_gsSqueakTemp_f := aFormOrCursor deepCopy.
			_gsSqueakTemp_map := aFormOrCursor colors]
		ifFalse: [_gsSqueakTemp_f := ColorForm extent: aFormOrCursor extent depth: aFormOrCursor depth.
			_gsSqueakTemp_f
				copyBits: aFormOrCursor boundingBox
				from: aFormOrCursor
				at: 0 @ 0
				clippingBox: aFormOrCursor boundingBox
				rule: Form over
				fillColor: nil.
			_gsSqueakTemp_map := Color indexedColors
						copyFrom: 1
						to: (1 bitShift: aFormOrCursor depth)].
	_gsSqueakTemp_map := _gsSqueakTemp_map
				collect: [:c | c = Color white
						ifTrue: [Color transparent]
						ifFalse: [c]].
	_gsSqueakTemp_f colors: _gsSqueakTemp_map.
	^ _gsSqueakTemp_f