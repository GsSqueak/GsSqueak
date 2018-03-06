instruction stream support
extensionsFor: pc in: aCompiledMethod into: trinaryBlock 
	"If the bytecode at pc is an extension, or if the bytecode at pc is
	preceeded by extensions,
	then evaluate aTrinaryBlock with the values of extA and extB and
	number of extension *bytes*.
	If the bytecode at pc is neither an extension or extended then
	evaluate with 0, 0, 0.
	There are no extensions in the SqueakV3/Smalltalk-80 bytecode set,
	so..."
	^ trinaryBlock
		value: 0
		value: 0
		value: 0