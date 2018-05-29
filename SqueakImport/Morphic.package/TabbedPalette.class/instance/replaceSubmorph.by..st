submorphs-add/remove
replaceSubmorph: oldMorph by: newMorph
	super replaceSubmorph: oldMorph by: newMorph.
	oldMorph == currentPage ifTrue:
		[currentPage := newMorph]