fileIn/out
attachToResource
	"Produce a morph from a file -- either a saved .morph file or a graphics
	file "
	| pathName |
	pathName := Utilities chooseFileWithSuffixFromList: #('.morph' ) , Utilities graphicsFileSuffixes withCaption: 'Choose a file
to load'.
	pathName
		ifNil: [^ self].
	"User made no choice"
	pathName == #none
		ifTrue: [^ self inform: 'Sorry, no suitable files found
(names should end with .morph, .gif,
.bmp, .jpeg, .jpe, .jp, or .form)'].
	self setProperty: #resourceFilePath toValue: pathName