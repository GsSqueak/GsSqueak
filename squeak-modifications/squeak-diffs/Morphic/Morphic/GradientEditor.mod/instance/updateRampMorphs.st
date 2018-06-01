change reporting
updateRampMorphs
	rampMorphs do:[ :i | i isInWorld ifFalse:[ rampMorphs remove: i]]