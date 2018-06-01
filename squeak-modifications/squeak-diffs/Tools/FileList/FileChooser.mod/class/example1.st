examples
example1
	"Open file chooser with the standard dialog box UI."
	"FileChooser example1"
	| fc stream |
	fc := FileChooser new.
	fc initializeAsDialogBox.
	stream := fc open.
	stream inspect.