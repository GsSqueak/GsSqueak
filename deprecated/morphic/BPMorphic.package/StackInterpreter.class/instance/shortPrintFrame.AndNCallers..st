debug printing
shortPrintFrame: theFP AndNCallers: n 
	(n ~= 0
			and: [stackPages couldBeFramePointer: theFP])
		ifTrue: [self shortPrintFrame: theFP.
			self
				shortPrintFrame: (self frameCallerFP: theFP)
				AndNCallers: n - 1]