examples
trace: aBlock onFileNamed: fileName
	"ContextPart trace: [3 factorial] onFileNamed: 'trace'"
	"This method uses the simulator to print calls to a file."

	^FileStream fileNamed: fileName do: [ :file |
		self trace: aBlock on: file ]