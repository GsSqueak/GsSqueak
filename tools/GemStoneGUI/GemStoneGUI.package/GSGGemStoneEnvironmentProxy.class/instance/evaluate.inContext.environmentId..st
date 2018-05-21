interface
evaluate: aString inContext: anObject environmentId: envId

	| query |
	query := '| anObject |
			anObject := {2}.
			({1}
				_compileInContext: anObject
				symbolList: {3}
				oldLitVars: nil
				environmentId: {4}
				flags: 0) _executeInContext: anObject'
				format: {
					aString storeString.
					anObject codeReferencingMe.
					self codeReferencingSymbolList.
					envId}.
	^ self fetchObject: query