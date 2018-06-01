menu
editDrawingIn: aPasteUpMorph forBackground: forBackground
	"Edit an existing sketch."

	| w bnds sketchEditor rotCenter aPaintTab aWorld aPaintBox |
	self world assureNotPaintingElse: [^self].
	w := aPasteUpMorph world.
	w prepareToPaint.
	w displayWorld.
	self visible: false.
	bnds := forBackground 
				ifTrue: [aPasteUpMorph boundsInWorld]
				ifFalse: 
					[bnds := self boundsInWorld expandBy: 60 @ 60.
					(aPasteUpMorph paintingBoundsAround: bnds center) merge: bnds]. 
	sketchEditor := SketchEditorMorph new.
	forBackground 
		ifTrue: [sketchEditor setProperty: #background toValue: true].
	w addMorphFront: sketchEditor.
	sketchEditor 
		initializeFor: self
		inBounds: bnds
		pasteUpMorph: aPasteUpMorph.
	rotCenter := self rotationCenter.

	sketchEditor afterNewPicDo: 
			[:aForm :aRect | | tfx | 
			self visible: true.
			self form: aForm.
			tfx := aPasteUpMorph transformFrom: aPasteUpMorph world.
			self topRendererOrSelf position: (tfx globalPointToLocal: aRect origin).
			self rotationStyle: sketchEditor rotationStyle.
			self forwardDirection: sketchEditor forwardDirection.
			(rotCenter notNil and: [(rotCenter = (0.5 @ 0.5)) not]) ifTrue:
				[self rotationCenter: rotCenter].
			(aPaintTab := (aWorld := self world) paintingFlapTab) 
				ifNotNil: [aPaintTab hideFlap]
				ifNil: [(aPaintBox := aWorld paintBox) ifNotNil: [aPaintBox delete]].
			self presenter drawingJustCompleted: self.

			forBackground ifTrue: [self goBehind	"shouldn't be necessary"]]
		ifNoBits: 
			[ | pal |"If no bits drawn.  Must keep old pic.  Can't have no picture"

			self visible: true.
			aWorld := self currentWorld.
			"sometimes by now I'm no longer in a world myself, but we still need
				 to get ahold of the world so that we can deal with the palette"
			((pal := aPasteUpMorph standardPalette) notNil and: [pal isInWorld]) 
				ifTrue: 
					[(aPaintBox := aWorld paintBox) ifNotNil: [aPaintBox delete].
					pal viewMorph: self]
				ifFalse: 
					[(aPaintTab := (aWorld := self world) paintingFlapTab) 
						ifNotNil: [aPaintTab hideFlap]
						ifNil: [(aPaintBox := aWorld paintBox) ifNotNil: [aPaintBox delete]]]]