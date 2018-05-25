memory space
lowSpaceThreshold 
	"Answer the low space threshold. When the amount of free memory (after garbage collection)
	 falls below this limit, the system is in serious danger of completely exhausting memory and
	 crashing. This limit should be made high enough to allow the user open a debugger to diagnose
	 a problem or to save the image.  In a stack-based VM such as Cog contexts for activations in
	 the stack zone will have to be created as the debugger opens, requiring additional headroom."

	| slotsForDebugger slotsForContextsOnStackPages |
	slotsForDebugger := 65536. "Arbitrary guess"
	slotsForContextsOnStackPages :=
		(self vmParameterAt: 42)
			ifNil: [0]
			ifNotNil:
				[:numStackPages| | headerSize numActivationsPerPage maxContextSize |
				numActivationsPerPage := 40. "Design goal of the Cog & Stack VMs"
				headerSize := 8 / self wordSize. "64-bits for Spur"
				maxContextSize := thisContext class instSize + CompiledMethod fullFrameSize + headerSize.
				numStackPages * numActivationsPerPage * maxContextSize].
	^slotsForDebugger + slotsForContextsOnStackPages * self wordSize
