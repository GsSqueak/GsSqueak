*Kernel-tool support
hasBreakpoint
	^ self class environment
		at: #BreakpointManager
		ifPresent: [:bpm | bpm methodHasBreakpoint: self]
		ifAbsent: [false]