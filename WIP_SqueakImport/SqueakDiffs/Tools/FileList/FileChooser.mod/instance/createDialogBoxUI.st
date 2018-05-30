ui creation
createDialogBoxUI
	"This method creates UI components and a layout that are suitable for a MorphicModel. Also centers the morphic view in the world. Note that the order of the method calls are important if you modify this."

	self
		createDialogBoxMorphicView;
		createDialogBoxCaptionPane;
		createDialogBoxButtonPane;
		createDirectoryPane;
		createFilePane;
		createDialogBoxLayout;
		centerMorphicView.
	^self morphicView