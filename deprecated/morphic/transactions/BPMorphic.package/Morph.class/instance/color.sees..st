-Etoys-geometry
color: sensitiveColor sees: soughtColor 
	"Return true if any of my pixels of sensitiveColor intersect with pixels of
	soughtColor. "
	"Make a mask with black where sensitiveColor is, white elsewhere"
	| _gsSqueakTemp_myImage _gsSqueakTemp_sensitivePixelMask _gsSqueakTemp_map _gsSqueakTemp_patchBelowMe _gsSqueakTemp_tfm _gsSqueakTemp_morphAsFlexed _gsSqueakTemp_i1 _gsSqueakTemp_pasteUp |
	_gsSqueakTemp_pasteUp := self world
				ifNil: [^ false].
	_gsSqueakTemp_tfm := self transformFrom: _gsSqueakTemp_pasteUp.
	_gsSqueakTemp_morphAsFlexed := _gsSqueakTemp_tfm isIdentity
				ifTrue: [self]
				ifFalse: [TransformationMorph new flexing: self clone byTransformation: _gsSqueakTemp_tfm].
	_gsSqueakTemp_myImage := _gsSqueakTemp_morphAsFlexed imageForm offset: 0 @ 0.
	_gsSqueakTemp_sensitivePixelMask := Form extent: _gsSqueakTemp_myImage extent depth: 1.
	"ensure at most a 16-bit map"
	_gsSqueakTemp_map := Bitmap
				new: (1
						bitShift: (_gsSqueakTemp_myImage depth - 1 min: 15)).
	_gsSqueakTemp_map at: (_gsSqueakTemp_i1 := sensitiveColor indexInMap: _gsSqueakTemp_map) put: 1.
	_gsSqueakTemp_sensitivePixelMask
		copyBits: _gsSqueakTemp_sensitivePixelMask boundingBox
		from: _gsSqueakTemp_myImage form
		at: 0 @ 0
		colorMap: _gsSqueakTemp_map.
	"get an image of the world below me"
	_gsSqueakTemp_patchBelowMe := _gsSqueakTemp_pasteUp
				patchAt: _gsSqueakTemp_morphAsFlexed fullBounds
				without: self
				andNothingAbove: false.
	"
	sensitivePixelMask displayAt: 0@0.
	patchBelowMe displayAt: 100@0
	"
	"intersect world pixels of the color we're looking for with the sensitive
	pixels "
	_gsSqueakTemp_map at: _gsSqueakTemp_i1 put: 0.
	"clear map and reuse it"
	_gsSqueakTemp_map
		at: (soughtColor indexInMap: _gsSqueakTemp_map)
		put: 1.
	_gsSqueakTemp_sensitivePixelMask
		copyBits: _gsSqueakTemp_patchBelowMe boundingBox
		from: _gsSqueakTemp_patchBelowMe
		at: 0 @ 0
		clippingBox: _gsSqueakTemp_patchBelowMe boundingBox
		rule: Form and
		fillColor: nil
		map: _gsSqueakTemp_map.
	"
	sensitivePixelMask displayAt: 200@0
	"
	^ _gsSqueakTemp_sensitivePixelMask tallyPixelValues second > 0