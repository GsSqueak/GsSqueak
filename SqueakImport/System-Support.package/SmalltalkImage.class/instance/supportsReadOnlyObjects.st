system attributes
supportsReadOnlyObjects
	"Answer whether the VM observes the per-object read-only flag and consequently aborts
	 writes to inst vars of, and fails primitives that attempt to modify, read-only objects."
	"SmalltalkImage current supportsReadOnlyObjects"

	^(self vmParameterAt: 65)
		ifNil: [false]
		ifNotNil:
			[:param| "In older VMs this is a boolean answering the vm-internal MULTIPLE_BYTECODE_SETS define"
			 param isInteger "In newer VMs it is a set of integer flags, bit 1 of which is the vm-internal IMMUTABILITY define"
				ifTrue: [param anyMask: 2]
				ifFalse: [false]]