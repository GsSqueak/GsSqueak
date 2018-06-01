simulation
runLeakChecker
	| _gsSqueakTemp_oldCheckForLeaks |
	_gsSqueakTemp_oldCheckForLeaks := objectMemory checkForLeaks.
	objectMemory setCheckForLeaks: -1.
	[objectMemory runLeakCheckerFor: GCModeIncremental]
		ensure: [objectMemory setCheckForLeaks: _gsSqueakTemp_oldCheckForLeaks]