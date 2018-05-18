fileIn/out
saveOnFile
	"Ask the user for a filename and save myself on a SmartReferenceStream file.  Writes out the version and class structure.  The file is fileIn-able.  UniClasses will be filed out."
	| aFileName |
	aFileName := ('my {1}.morph' translated format: {self class name}) asFileName.	"do better?"
	aFileName := UIManager default saveFilenameRequest: 'File name?' translated 
			initialAnswer: aFileName.
	aFileName ifNil: [^ Beeper beep].

	self allMorphsDo: [:m | m prepareToBeSaved].

	self saveOnFileNamed: aFileName