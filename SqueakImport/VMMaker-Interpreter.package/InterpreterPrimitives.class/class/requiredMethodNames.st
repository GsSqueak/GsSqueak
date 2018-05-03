translation
requiredMethodNames
	"Return the list of method names that should be retained for export or other support reasons.
	Include all of the selectors for primitives to ensure translation in slang browser."

	^super requiredMethodNames,
		#(floatArg: integerArg: methodArg: methodReturnValue: objectArg: primitiveMethod),
		(self selectors select: [:e | 'primitive*' match: e])