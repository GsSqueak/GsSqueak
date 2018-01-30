instance creation
newFrom: aCompiledMethod
	"Clone the argument, aCompiledMethod"
	| inst |
	"CompiledMethod newFrom: CompiledMethod class >> #newFrom:"
	inst := self newMethod: aCompiledMethod basicSize - aCompiledMethod initialPC + 1
				header: aCompiledMethod header.
	1 to: aCompiledMethod numLiterals do:
		[:index|
		inst literalAt: index put: (aCompiledMethod literalAt: index)].
	aCompiledMethod initialPC to: aCompiledMethod size do:
		[:index |
		inst at: index put: (aCompiledMethod at: index)].
	inst postCopy.
	^inst