private-exceptions
cannotReturn: result

	closureOrNil notNil ifTrue:
		[^self cannotReturn: result to: self home sender].
	ToolSet
		debugContext: thisContext
		label: 'computation has been terminated'
		contents: nil