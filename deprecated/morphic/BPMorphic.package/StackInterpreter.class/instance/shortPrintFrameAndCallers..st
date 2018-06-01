debug printing
shortPrintFrameAndCallers: theFP 
	(stackPages couldBeFramePointer: theFP)
		ifFalse: [^ nil].
	self shortPrintFrame: theFP.
	(self isBaseFrame: theFP)
		ifFalse: [self
				shortPrintFrameAndCallers: (self frameCallerFP: theFP)]