ui creation
createSystemWindowUIWithCaptionPane
	self
		createSystemWindowMorphicView;
		createSystemWindowCaptionPane;
		createSystemWindowButtonPane;
		createDirectoryPane;
		createFilePane;
		createSystemWindowLayoutWithCaptionPane.
	^self morphicView