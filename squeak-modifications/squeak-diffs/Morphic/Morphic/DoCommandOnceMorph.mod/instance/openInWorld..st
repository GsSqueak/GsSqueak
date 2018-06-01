initialization
openInWorld: aWorld

	self position: aWorld topLeft + (aWorld extent - self extent // 2).
	super openInWorld: aWorld