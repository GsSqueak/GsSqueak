*network
httpPostDocument: url args: argsDict
	| argString |
	argString := argsDict
		ifNotNil: [argString := HTTPSocket argString: argsDict]
		ifNil: [''].
	^self post: argString url: url , argString ifError: [self halt]