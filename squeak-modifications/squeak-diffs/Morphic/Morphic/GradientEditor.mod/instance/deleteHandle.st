change reporting
deleteHandle
	rampMorphs do:[ :i | (i color == Color black) ifTrue:[ rampMorphs remove: i. row removeMorph: i]].
	self updateColorRamp
	
