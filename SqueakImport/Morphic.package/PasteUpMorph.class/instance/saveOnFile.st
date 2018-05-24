objects from disk
saveOnFile
	"Ask the user for a filename and save myself on a SmartReferenceStream file.  Writes out the version and class structure.  The file is fileIn-able.  UniClasses will be filed out."

	| aFileName fileStream |

	self flag: #bob0302.
	self isWorldMorph ifTrue: [^self project saveAs].

	aFileName := ('my {1}.project' translated format: {self class name}) asFileName.	"do better?"
	aFileName := UIManager default saveFilenameRequest: 'File name?' translated 
			initialAnswer: aFileName.
	aFileName ifNil: [^ Beeper beep].
	self allMorphsDo: [:m | m prepareToBeSaved].

	fileStream := FileStream newFileNamed: aFileName.
	fileStream fileOutClass: nil andObject: self.	"Puts UniClass definitions out anyway"