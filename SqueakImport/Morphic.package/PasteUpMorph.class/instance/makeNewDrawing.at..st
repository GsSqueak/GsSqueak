world menu
makeNewDrawing: evt at: aPoint
	"make a new drawing, triggered by the given event, with the painting area centered around the given point"

	| w newSketch newPlayer sketchEditor aPalette rect aPaintBox aPaintTab aWorld |
	w := self world.
	w assureNotPaintingElse: [^ self].
	rect := self paintingBoundsAround: aPoint.
	aPalette := self standardPalette.
	aPalette ifNotNil: [aPalette showNoPalette; layoutChanged].
	w prepareToPaint.

	newSketch := self drawingClass new.
	Smalltalk at: #UnscriptedPlayer ifPresent:[:aClass|
		newSketch player: (newPlayer := aClass newUserInstance).
		newPlayer costume: newSketch.
	].
	newSketch nominalForm: (Form extent: rect extent depth: w assuredCanvas depth).
	newSketch bounds: rect.
	sketchEditor := SketchEditorMorph new.
	w addMorphFront: sketchEditor.
	sketchEditor initializeFor: newSketch inBounds: rect pasteUpMorph: self.
	sketchEditor
		afterNewPicDo: [:aForm :aRect | | tfx whereToPresent |
			whereToPresent := self presenter.
			newSketch form: aForm.
			tfx := self transformFrom: w.
			newSketch position: (tfx globalPointToLocal: aRect origin).
			newSketch rotationStyle: sketchEditor rotationStyle.
			newSketch forwardDirection: sketchEditor forwardDirection.

			newPlayer ifNotNil:[newPlayer setHeading: sketchEditor forwardDirection].
			(aPaintTab := (aWorld := self world) paintingFlapTab)
				ifNotNil:[aPaintTab hideFlap]
				ifNil:[(aPaintBox := aWorld paintBox) ifNotNil:[aPaintBox delete]].

			self addMorphFront: (newPlayer ifNil:[newSketch] ifNotNil:[newPlayer costume]).
			w startSteppingSubmorphsOf: newSketch.
			whereToPresent drawingJustCompleted: newSketch]
		 ifNoBits:[
			(aPaintTab := (aWorld := self world) paintingFlapTab)
				ifNotNil:[aPaintTab hideFlap]
				ifNil:[(aPaintBox := aWorld paintBox) ifNotNil:[aPaintBox delete]].
			aPalette ifNotNil: [aPalette showNoPalette].]