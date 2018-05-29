I am a place-holder for information needed by the Debugger to inspect method activations.  See DebuggerMethodMap's comment. I map methods compiled using full block closures.

Instance variables
	(inherited)
	abstractSourceRanges <Dictionary of: CompiledCode -> (Dictionary of: Integer-> Interval)
	startKeysToTempRefs <Dictionary of: CompiledCode -> Array of: (Array with: String with: temp reference)> where
		temp reference ::= Integer
							| (Array with: Integer with: Integer)
							| (Array with: #outer with: temp reference)
	(locally defined)
	sortedSourceMaps <Dictionary of: CompiledCode -> (Dictionary of: Integer-> Interval)