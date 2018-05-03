initialization
imageFormatVersion
	"The imageFormatVersionNumber variable is initialized in Interpreter class>>declareCVarsIn:
	so provide the value here for simulation."

	^ imageFormatVersionNumber
		ifNil: [imageFormatVersionNumber := objectMemory bytesPerWord == 4
						ifTrue: [6502]
						ifFalse: [68000]]