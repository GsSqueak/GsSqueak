initialization
initializeInterpreterSourceVersion
	"Identify the VMMaker source version that generated the C code for an
	interpreter. Provides a runtime version identification test."

	Smalltalk at: #VMMaker
		ifPresent: [:vmm | ^ InterpreterSourceVersion := vmm versionString].
	^ InterpreterSourceVersion := ''