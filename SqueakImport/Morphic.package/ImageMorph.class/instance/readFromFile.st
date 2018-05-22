menu commands
readFromFile
	"This would benefit from a way to get a list of the plausible file extensions for image files"
	| fileName |
	fileName := UIManager default
		chooseFileMatchingSuffixes: Form allTypicalFileExtensions
		label: 'Please enter the image file name'.
	fileName isEmpty ifTrue: [^ self].
	self image: (Form fromFileNamed:  fileName).
