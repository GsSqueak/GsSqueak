drawing-general
fullDraw: aMorph
	super fullDraw: aMorph.
	morphLevel = 0 ifTrue: [
		self writeTrailer: 1.
	]