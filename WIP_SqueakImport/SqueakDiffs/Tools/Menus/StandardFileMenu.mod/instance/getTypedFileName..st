basic control sequences
getTypedFileName: aResult

	| name |
	name := UIManager default 
		request: 'Enter a new file name' 
		initialAnswer: ''.
	name = '' ifTrue: [^self startUpWithCaption: 'Select a File:' translated].
	name := aResult directory fullNameFor: name.
	^ StandardFileMenuResult
			directory: (FileDirectory forFileName: name)
			name: (FileDirectory localNameFor: name)
