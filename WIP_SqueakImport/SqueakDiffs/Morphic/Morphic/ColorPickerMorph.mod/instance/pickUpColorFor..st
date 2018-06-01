menu
pickUpColorFor: aMorph
	"Show the eyedropper cursor, and modally track the mouse through a mouse-down and mouse-up cycle"

      | aHand localPt c |
	aHand := aMorph ifNil: [self activeHand] ifNotNil: [aMorph activeHand].
	aHand ifNil: [aHand := self currentHand].
	self addToWorld: aHand world near: (aMorph ifNil: [aHand world]) fullBounds.
	self owner ifNil: [^ self].

	aHand showTemporaryCursor: (ScriptingSystem formAtKey: #Eyedropper) 
			hotSpotOffset: 6 negated @ 4 negated.    "<<<< the form was changed a bit??"

	self updateContinuously: false.
	[Sensor anyButtonPressed]
		whileFalse: 
			 [self trackColorUnderMouse].
	self deleteAllBalloons.

	localPt := Sensor cursorPoint - self topLeft.
	self inhibitDragging ifFalse: [
		(DragBox containsPoint: localPt) ifTrue:
			["Click or drag the drag-dot means to anchor as a modeless picker"
			^ self anchorAndRunModeless: aHand].
	].
	(clickedTranslucency := TransparentBox containsPoint: localPt)
		ifTrue: [selectedColor := originalColor].

	self updateContinuously: true.
	[Sensor anyButtonPressed]
		whileTrue:
			 [self updateTargetColorWith: self indicateColorUnderMouse].
	c := self getColorFromKedamaWorldIfPossible: Sensor cursorPoint.
	c ifNotNil: [selectedColor := c].
	aHand newMouseFocus: nil;
		showTemporaryCursor: nil;
		flushEvents.
	self delete.
		 
 