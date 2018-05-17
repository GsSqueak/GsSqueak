accessing
instanceMethods

	| modifiedMethods originalMethods |
	modifiedMethods := instanceMethods ifNil: [Array new].
	originalMethods := self realClass theNonMetaClass methodDict values collect: 
			[:compiledMethod | GSSMethodDefinition newFromMethodReference: compiledMethod methodReference ]. 
	^ self overlayMethods: originalMethods with: modifiedMethods.