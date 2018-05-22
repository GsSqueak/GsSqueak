examples
example2
	"Open file chooser with a system window UI."
	"FileChooser example2"
	| fc stream |
	fc := FileChooser new.
	fc initializeAsSystemWindow.
	stream := fc open.
	stream inspect.