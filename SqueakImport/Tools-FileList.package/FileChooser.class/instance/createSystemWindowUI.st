ui creation
createSystemWindowUI
	"This method creates UI components and a layout that are suitable for a SystemWindow. Note that the order of the method calls are important."

	self
		createSystemWindowMorphicView;
		createSystemWindowButtonPane;
		createDirectoryPane;
		createFilePane;
		createSystemWindowLayout.
	^self morphicView