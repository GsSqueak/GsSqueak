debug printing
printFrameAndCallers: theFP SP: theSP
	<inline: false>
	<var: #theFP type: #'char *'>
	<var: #theSP type: #'char *'>
	(stackPages couldBeFramePointer: theFP) ifFalse: [^nil].
	(self isBaseFrame: theFP) ifFalse:
		[self printFrameAndCallers: (self frameCallerFP: theFP)
			SP: (self frameCallerSP: theFP)].
	self cr.
	self printFrame: theFP WithSP: theSP