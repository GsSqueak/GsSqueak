submorphs-accessing
submorphThat: block1 ifNone: block2 
	^ submorphs detect: block1 ifNone: block2