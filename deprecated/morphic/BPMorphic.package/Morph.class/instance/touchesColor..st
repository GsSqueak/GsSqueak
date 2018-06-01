-Etoys-geometry
touchesColor: soughtColor 
	"Return true if any of my pixels overlap pixels of soughtColor."
	"Make a shadow mask with black in my shape, white elsewhere"
	| _gsSqueakTemp_map _gsSqueakTemp_patchBelowMe _gsSqueakTemp_shadowForm _gsSqueakTemp_tfm _gsSqueakTemp_morphAsFlexed _gsSqueakTemp_pasteUp |
	_gsSqueakTemp_pasteUp := self world
				ifNil: [^ false].
	_gsSqueakTemp_tfm := self transformFrom: _gsSqueakTemp_pasteUp.
	_gsSqueakTemp_morphAsFlexed := _gsSqueakTemp_tfm isIdentity
				ifTrue: [self]
				ifFalse: [TransformationMorph new flexing: self clone byTransformation: _gsSqueakTemp_tfm].
	_gsSqueakTemp_shadowForm := _gsSqueakTemp_morphAsFlexed shadowForm offset: 0 @ 0.
	"get an image of the world below me"
	_gsSqueakTemp_patchBelowMe := (_gsSqueakTemp_pasteUp
				patchAt: _gsSqueakTemp_morphAsFlexed fullBounds
				without: self
				andNothingAbove: false)
				offset: 0 @ 0.
	"
	shadowForm displayAt: 0@0.
	patchBelowMe displayAt: 100@0
	"
	"intersect world pixels of the color we're looking for with our shape."
	"ensure a maximum 16-bit map"
	_gsSqueakTemp_map := Bitmap
				new: (1
						bitShift: (_gsSqueakTemp_patchBelowMe depth - 1 min: 15)).
	_gsSqueakTemp_map
		at: (soughtColor indexInMap: _gsSqueakTemp_map)
		put: 1.
	_gsSqueakTemp_shadowForm
		copyBits: _gsSqueakTemp_patchBelowMe boundingBox
		from: _gsSqueakTemp_patchBelowMe
		at: 0 @ 0
		clippingBox: _gsSqueakTemp_patchBelowMe boundingBox
		rule: Form and
		fillColor: nil
		map: _gsSqueakTemp_map.
	"
	shadowForm displayAt: 200@0
	"
	^ _gsSqueakTemp_shadowForm tallyPixelValues second > 0