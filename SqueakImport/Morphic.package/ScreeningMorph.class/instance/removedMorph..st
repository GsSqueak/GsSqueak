private
removedMorph: aMorph

	submorphs size = 1 ifTrue:
		[self bounds: submorphs first bounds].
	super removedMorph: aMorph.