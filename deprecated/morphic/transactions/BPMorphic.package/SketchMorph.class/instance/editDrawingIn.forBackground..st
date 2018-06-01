menu
editDrawingIn: aPasteUpMorph forBackground: forBackground 
	"Edit an existing sketch."
	| _gsSqueakTemp_w _gsSqueakTemp_bnds _gsSqueakTemp_sketchEditor _gsSqueakTemp_rotCenter _gsSqueakTemp_aPaintTab _gsSqueakTemp_aWorld _gsSqueakTemp_aPaintBox |
	self world
		assureNotPaintingElse: [^ self].
	_gsSqueakTemp_w := aPasteUpMorph world.
	_gsSqueakTemp_w prepareToPaint.
	_gsSqueakTemp_w displayWorld.
	self visible: false.
	_gsSqueakTemp_bnds := forBackground
				ifTrue: [aPasteUpMorph boundsInWorld]
				ifFalse: [_gsSqueakTemp_bnds := self boundsInWorld expandBy: 60 @ 60.
					(aPasteUpMorph paintingBoundsAround: _gsSqueakTemp_bnds center)
						merge: _gsSqueakTemp_bnds].
	_gsSqueakTemp_sketchEditor := SketchEditorMorph new.
	forBackground
		ifTrue: [_gsSqueakTemp_sketchEditor setProperty: #background toValue: true].
	_gsSqueakTemp_w addMorphFront: _gsSqueakTemp_sketchEditor.
	_gsSqueakTemp_sketchEditor
		initializeFor: self
		inBounds: _gsSqueakTemp_bnds
		pasteUpMorph: aPasteUpMorph.
	_gsSqueakTemp_rotCenter := self rotationCenter.
	_gsSqueakTemp_sketchEditor
		afterNewPicDo: [:aForm :aRect | 
			| tfx |
			self visible: true.
			self form: aForm.
			tfx := aPasteUpMorph transformFrom: aPasteUpMorph world.
			self topRendererOrSelf
				position: (tfx globalPointToLocal: aRect origin).
			self rotationStyle: _gsSqueakTemp_sketchEditor rotationStyle.
			self forwardDirection: _gsSqueakTemp_sketchEditor forwardDirection.
			(_gsSqueakTemp_rotCenter notNil
					and: [(_gsSqueakTemp_rotCenter = (0.5 @ 0.5)) not])
				ifTrue: [self rotationCenter: _gsSqueakTemp_rotCenter].
			(_gsSqueakTemp_aPaintTab := (_gsSqueakTemp_aWorld := self world) paintingFlapTab)
				ifNil: [(_gsSqueakTemp_aPaintBox := _gsSqueakTemp_aWorld paintBox)
						ifNotNil: [_gsSqueakTemp_aPaintBox delete]]
				ifNotNil: [_gsSqueakTemp_aPaintTab hideFlap].
			self presenter drawingJustCompleted: self.
			forBackground
				ifTrue: [self goBehind
					"shouldn't be necessary"]]
		ifNoBits: [| pal |
			"If no bits drawn. Must keep old pic. Can't have no picture"
			self visible: true.
			_gsSqueakTemp_aWorld := self currentWorld.
			"sometimes by now I'm no longer in a world myself, but we still
			need to get ahold of the world so that we can deal with the
			palette "
			((pal := aPasteUpMorph standardPalette) notNil
					and: [pal isInWorld])
				ifTrue: [(_gsSqueakTemp_aPaintBox := _gsSqueakTemp_aWorld paintBox)
						ifNotNil: [_gsSqueakTemp_aPaintBox delete].
					pal viewMorph: self]
				ifFalse: [(_gsSqueakTemp_aPaintTab := (_gsSqueakTemp_aWorld := self world) paintingFlapTab)
						ifNil: [(_gsSqueakTemp_aPaintBox := _gsSqueakTemp_aWorld paintBox)
								ifNotNil: [_gsSqueakTemp_aPaintBox delete]]
						ifNotNil: [_gsSqueakTemp_aPaintTab hideFlap]]]