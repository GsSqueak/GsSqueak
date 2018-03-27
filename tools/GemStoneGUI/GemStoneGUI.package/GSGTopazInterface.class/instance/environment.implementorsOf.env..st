new api - navigation
environment: environmentProxy implementorsOf: selector env: envId

	| query topazOutput |
	query := self codeForPrintingListCreatedBy: (
				self codeForSerializingMethods: (
					(self codeForClassOrganizerOn: environmentProxy env: envId)) , 
						' implementorsOf: ' , selector asSymbol printString).
	topazOutput := self run: query.
	(topazOutput second notEmpty or: [topazOutput first isEmpty]) ifTrue: [^ #()].
	^ self convertToMethodList: topazOutput first environment: environmentProxy