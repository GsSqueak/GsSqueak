examples
example4
	"Open file chooser with a customized dialog box UI. The order of the messages is important. In general, call the initialize method first, then modify things, and finally call open."
	"FileChooser example4"
	| fc stream |
	fc := FileChooser new.
	fc initializeAsDialogBox.
	fc setDirectory: FileDirectory root.
	fc setSuffixes: {'png' . 'gif' . 'bmp' . 'jpg' . 'jpeg' }.
	fc setCaption: 'Select a picture file' translated.
	fc morphicView 
		borderColor: Color black; 
		borderWidth: 2;
		color: Color white.
	fc setPaneColor: Color gray muchLighter.
	fc captionPane color: Color orange muchLighter.
	fc okButton color: Color green muchLighter.
	fc cancelButton color: Color blue muchLighter.
	fc morphicView position: 20@20.
	stream := fc open.
	stream ifNotNil: [(Form fromBinaryStream: stream) asMorph openInHand].