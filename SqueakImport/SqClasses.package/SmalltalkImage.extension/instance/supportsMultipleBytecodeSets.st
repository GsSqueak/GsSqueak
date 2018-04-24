*SqClasses-*SqClasses-*SqClasses-system attributes
supportsMultipleBytecodeSets
	"Answer whether the VM supports multiple bytecodeSets."
	"SmalltalkImage current supportsMultipleBytecodeSets"

	^(self vmParameterAt: 65)
		ifNil: [false]
		ifNotNil:
			[:param| "In older VMs this is a boolean answering the vm-internal MULTIPLE_BYTECODE_SETS define"
			 param isInteger "In newer VMs it is a set of integer flags, bit 0 of which is the vm-internal MULTIPLE_BYTECODE_SETS define"
				ifTrue: [param anyMask: 1]
				ifFalse: [param]]
