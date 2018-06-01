preferences
globalCommandKeysEnabled
	<preference: 'Enable Global Command Keys' category: 'Morphic' description: 'When true, the global command keys are enabled.  Command-key help is available from the help menu.' type: #Boolean>
	^ GlobalCommandKeysEnabled
		ifNil: [true]