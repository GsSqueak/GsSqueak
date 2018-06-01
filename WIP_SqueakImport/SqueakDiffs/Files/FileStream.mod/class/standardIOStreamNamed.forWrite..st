stdio
standardIOStreamNamed: moniker forWrite: forWrite
	
	| index |
	index := #(stdin stdout stderr) identityIndexOf: moniker.
	^((StdioFiles ifNil: [ StdioFiles := Array new: 3 ]) at: index)
		ifNil: [
			StdioFiles
				at: index 
				put: (
					(TheStdioHandles at: index)
						ifNil: [ ^self error: moniker, ' is unavailable' ]
						ifNotNil: [ :handle |
							self stdioStreamClass newForStdio
								openOnHandle: handle
								name: moniker
								forWrite: forWrite ]) ]
