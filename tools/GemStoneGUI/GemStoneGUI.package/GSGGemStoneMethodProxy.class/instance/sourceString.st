interface
sourceString
	
	| query |
	query := '{1} ifNotNil: [:method | method sourceString]'
				format: {
					self codeReferencingMe}.
	^ (self repository fetchString: query) ifNil: ['Missing']