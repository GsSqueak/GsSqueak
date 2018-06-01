as yet unclassified
morphAsPostscript: aMorph rotated: rotateFlag offsetBy: offset specs: specsOrNil


	^[
		(self new morphAsPostscript: aMorph rotated: rotateFlag offsetBy: offset) close
	]
		on: PickAFileToWriteNotification
		do: [ :ex |
			| newFileName stream |
			newFileName := UIManager default
				saveFilenameRequest: 'Name of file to write:' translated
				initialAnswer: 'xxx',Time millisecondClockValue printString, self defaultExtension. 
			newFileName isEmptyOrNil ifFalse: [
				stream := FileStream fileNamed: newFileName.
				stream ifNotNil: [ex resume: stream].
			].
		].

