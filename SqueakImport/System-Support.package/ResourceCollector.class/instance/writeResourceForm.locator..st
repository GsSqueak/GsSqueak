resource writing
writeResourceForm: aForm locator: aLocator
	"Store the given form on a file. Return an array with the name and the size of the file"
	| fName fStream fullSize result writerClass |
	aLocator ifNotNil:[
		result := self writeResourceForm: aForm fromLocator: aLocator.
		result ifNotNil:[^result]
		"else fall through"
	].
	fName := localDirectory nextNameFor:'resource' extension:'form'.
	fStream := localDirectory newFileNamed: fName.
	fStream binary.
	aForm storeResourceOn: fStream.
false ifTrue:[
	"What follows is a Really, REALLY bad idea. I leave it in as a reminder of what you should NOT do. 
	PART I: Using JPEG or GIF compression on forms where we don't have the original data means loosing both quality and alpha information if present..."
	writerClass := ((Smalltalk includesKey: #JPEGReaderWriter2)
		and: [(Smalltalk at: #JPEGReaderWriter2) new isPluginPresent])
		ifTrue: [(Smalltalk at: #JPEGReaderWriter2)]
		ifFalse: [GIFReadWriter].
	writerClass putForm: aForm onStream: fStream.
	fStream open.
	fullSize := fStream size.
	fStream close.
].

	"Compress contents here"
true ifTrue:[
	"...PART II: Using the builtin compression which combines RLE+ZIP is AT LEAST AS GOOD as PNG and how much more would you want???"
	fStream position: 0.
	fStream compressFile.
	localDirectory deleteFileNamed: fName.
	localDirectory rename: fName, FileDirectory dot, 'gz' toBe: fName.
	fStream := localDirectory readOnlyFileNamed: fName.
	fullSize := fStream size.
	fStream close.
].
	^{fName. fullSize}