menu commands
repaintEntry
	"Let the user enter into painting mode to repaint the item and save it back."

	| aWorld bnds sketchEditor aPaintBox formToEdit |
	
	(aWorld := self world) assureNotPaintingElse: [^ self].

	aWorld prepareToPaint.
	aWorld displayWorld.
	formToEdit := formChoices at: currentIndex.
	bnds := (submorphs second boundsInWorld origin extent: formToEdit extent) intersect: aWorld bounds.
	bnds := (aWorld paintingBoundsAround: bnds center) merge: bnds.
	sketchEditor := SketchEditorMorph new.
	aWorld addMorphFront: sketchEditor.
	sketchEditor initializeFor: ((aWorld drawingClass withForm: formToEdit) position: submorphs second positionInWorld)  inBounds: bnds pasteUpMorph: aWorld paintBoxPosition: bnds topRight.
	sketchEditor
		afterNewPicDo: [:aForm :aRect |
			formChoices at: currentIndex put: aForm.
			baseDictionary at: (entryNames at: currentIndex) put: aForm.
			self updateThumbnail.
			(aPaintBox := aWorld paintBoxOrNil) ifNotNil: [aPaintBox delete]] 
		ifNoBits:
			[(aPaintBox := aWorld paintBoxOrNil) ifNotNil: [aPaintBox delete]].
	
