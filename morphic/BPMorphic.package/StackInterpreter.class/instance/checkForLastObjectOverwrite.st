simulation
checkForLastObjectOverwrite
	| _gsSqueakTemp_freeStart |
	checkAllocFiller
		ifTrue: [self
				assert: ((_gsSqueakTemp_freeStart := objectMemory freeStart) >= objectMemory scavengeThreshold
						or: [(objectMemory longAt: _gsSqueakTemp_freeStart)
								= _gsSqueakTemp_freeStart])]