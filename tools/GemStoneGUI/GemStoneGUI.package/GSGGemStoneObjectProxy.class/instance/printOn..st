interface
printOn: aStream

	| query printString |
	query := '{1} printString'
				format: {
					self codeReferencingMe}.
	printString := self repository fetchString: query.
	aStream nextPutAll: printString