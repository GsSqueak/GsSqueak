debug support
lookupBreakFor: lookupClass 
	(objectMemory shouldBreakForLookupIn: lookupClass given: breakLookupClassTag)
		ifTrue: [self
				cCode: [self warning: 'lookup class send break (heartbeat suppressed)']
				inSmalltalk: [self halt: 'Lookup in class ' , lookupClass hex]]