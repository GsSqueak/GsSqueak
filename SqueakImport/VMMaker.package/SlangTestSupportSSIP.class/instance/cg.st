translation
cg
	"Lazy initialize, once per test"

	cg ifNil: [ObjectMemory initialize; initializeConstants.
		cg := self class buildCodeGeneratorInlined: inlineFlag = true.
		cg prepareMethodsInlined: inlineFlag = true doAssertions: true].
	^ cg