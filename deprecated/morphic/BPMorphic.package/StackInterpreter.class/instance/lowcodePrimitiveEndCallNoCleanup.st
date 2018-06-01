inline primitive generated code
lowcodePrimitiveEndCallNoCleanup
	"Lowcode instruction generator"
	"Restore the shadow stack pointer"
	shadowCallStackPointer := (self shadowCallStackPointerIn: localFP)
				- 1.
	self
		shadowCallStackPointerIn: localFP
		put: (self cCoerce: 1 to: #'char*')