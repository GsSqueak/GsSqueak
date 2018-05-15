accessing
classMethods

	| modifiedMethods originalMethods |
	modifiedMethods := classMethods ifNil: [Array new].
	originalMethods := self realClass theMetaClass methodDict values collect:
			[:compiledMethod | GSSMethodDefinition newFromMethodReference: compiledMethod methodReference].
	^ self overlayMethods: originalMethods with: modifiedMethods.