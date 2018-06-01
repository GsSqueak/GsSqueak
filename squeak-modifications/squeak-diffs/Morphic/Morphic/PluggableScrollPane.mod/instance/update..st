updating
update: aspect

	aspect == #submorphs
		ifTrue: [self updateMorph].

	super update: aspect.