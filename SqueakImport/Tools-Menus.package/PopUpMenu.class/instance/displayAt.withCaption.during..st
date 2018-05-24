displaying
displayAt: aPoint withCaption: captionOrNil during: aBlock
	"Display the receiver just to the right of aPoint while aBlock is evaluated.  If the receiver is forced off screen, display it just to the right."
	| delta savedArea captionForm captionSave outerFrame captionText tFrame frameSaveLoc captionBox |
	marker ifNil: [self computeForm].
	frame := frame align: marker leftCenter with: aPoint + (2@0).
	outerFrame := frame.
	captionOrNil notNil ifTrue:
		[captionText := (DisplayText
				text: captionOrNil asText
				textStyle: MenuStyle copy centered)
					foregroundColor: (self userInterfaceTheme textColor ifNil: [Color black])
					backgroundColor: (self userInterfaceTheme color ifNil: [Color white]).
		tFrame := captionText boundingBox insetBy: -2.
		outerFrame := frame merge: (tFrame align: tFrame bottomCenter
					with: frame topCenter + (0@2))].
	delta := outerFrame amountToTranslateWithin: Display boundingBox.
	frame right > Display boundingBox right
		ifTrue: [delta := 0 - frame width @ delta y].
	frame := frame translateBy: delta.
	captionOrNil notNil ifTrue:
		[captionForm := captionText form.
		captionBox := captionForm boundingBox expandBy: 4.
		captionBox := captionBox align: captionBox bottomCenter
								with: frame topCenter + (0@2).
		captionSave := Form fromDisplay: captionBox.
		Display border: captionBox width: 4 fillColor: (self userInterfaceTheme color ifNil: [Color white]).
		Display border: captionBox width: 2 fillColor: (self userInterfaceTheme textColor ifNil: [Color black]).
		captionForm displayAt: captionBox topLeft + 4].
	marker := marker align: marker leftCenter with: aPoint + delta +  (2@0).
	savedArea := Form fromDisplay: frame.
	self menuForm displayOn: Display at: (frameSaveLoc := frame topLeft).
	selection ~= 0 ifTrue: [Display reverse: marker].
	Cursor normal showWhile: aBlock.
	savedArea displayOn: Display at: frameSaveLoc.
	captionOrNil notNil ifTrue:
		[captionSave displayOn: Display at: captionBox topLeft]