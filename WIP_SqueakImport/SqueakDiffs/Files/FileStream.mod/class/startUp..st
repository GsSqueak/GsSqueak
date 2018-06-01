system startup
startUp: resuming
	
	resuming ifTrue: [
		self voidStdioFiles.
		[ TheStdioHandles := self stdioHandles ]
			on: Error
			do: [:ex|
				TheStdioHandles isArray ifFalse: [
					TheStdioHandles := Array new: 3 ] ].
		(Smalltalk classNamed: 'TranscriptStream')
			ifNotNil: [ :t | "Reestablish dependency for stdout Transcript view"
				t redirectToStdOut: t redirectToStdOut ] ]
