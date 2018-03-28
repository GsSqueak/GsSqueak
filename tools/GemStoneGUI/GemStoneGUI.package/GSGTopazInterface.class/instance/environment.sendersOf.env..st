new api - navigation
environment: environmentProxy sendersOf: selector env: envId

	| query topazOutput |
	query := self codeForPrintingListCreatedBy: (
				self codeForSerializingMethods: (
					'(' , (self codeForClassOrganizerOn: environmentProxy env: envId)) , 
						' sendersOf: ' , selector asSymbol printString , ') first').
	topazOutput := self run: query.
	(topazOutput second notEmpty or: [topazOutput first isEmpty]) ifTrue: [^ #()].
	^ self convertToMethodList: topazOutput first environment: environmentProxy