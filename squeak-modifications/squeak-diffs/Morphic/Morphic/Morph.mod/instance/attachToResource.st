fileIn/out
attachToResource
	"Connect a file -- either a saved .morph file or a graphics file as my resource.
	There appears to be nothing preventing a user from attaching a completely unrelated file ?"

	| pathName |
	pathName := UIManager default chooseFileMatchingSuffixes: (Form allTypicalFileExtensions add: 'morph'; yourself) label: 'Choose a file to load' translated.
	pathName ifNil: [^ self].  "User made no choice"

	self setProperty: #resourceFilePath toValue: pathName