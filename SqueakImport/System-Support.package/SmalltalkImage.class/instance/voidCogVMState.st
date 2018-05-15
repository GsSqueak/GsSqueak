miscellaneous
voidCogVMState
	"Void any internal caches the VM maintains other than the method lookup caches.
	 These comprise
		- the stack zone, where method activations are stored, and
		- the machine code zone, where the machine code form of CompiledMethods is held."
	self notYetImplemented.
	^self primitiveFailed

	"Time millisecondsToRun: [Smalltalk voidCogVMState]"
	"(1 to: 10) collect: [:ign| Time millisecondsToRun: [Smalltalk voidCogVMState]]"