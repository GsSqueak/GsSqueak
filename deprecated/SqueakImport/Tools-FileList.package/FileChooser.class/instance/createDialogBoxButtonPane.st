ui creation
createDialogBoxButtonPane
	"Create buttons suitable for a MorphicModel file chooser."

	buttonPane := AlignmentMorph new.
	buttonPane
		layoutPolicy: ProportionalLayout new;
		color: Color transparent;
		borderWidth: 0.
	self createOkButton.
	self createCancelButton.
	buttonPane addMorph: self cancelButton
		fullFrame: (LayoutFrame fractions: (0 @ 0 corner: 0.49 @ 1.0)
				offsets: (0 @ 0 corner: 0 @ 0)).
	buttonPane addMorph: self okButton
		fullFrame: (LayoutFrame fractions: (0.51 @ 0 corner: 1.0 @ 1.0)
				offsets: (0 @ 0 corner: 0 @ 0)).
	^buttonPane