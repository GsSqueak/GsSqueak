accessing - real class
methodDefinitionsForClass: aClass

	^ aClass methodDict values collect:
		[:compiledMethod | GSSMethodDefinition newFromMethodReference: compiledMethod methodReference].