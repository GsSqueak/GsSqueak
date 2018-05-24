interface
classNames

	| query |
	query := '{1} allClasses collect: [:class | class name asSymbol]'
				format: {
					self codeReferencingMe}.
	^ self repository fetchArrayOfSymbols: query