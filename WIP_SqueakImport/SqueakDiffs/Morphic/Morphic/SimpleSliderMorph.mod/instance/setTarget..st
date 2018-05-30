menu
setTarget: evt 
	| rootMorphs |
	rootMorphs := self world rootMorphsAt: evt  targetPoint.
	target := rootMorphs size > 1
				ifTrue: [rootMorphs second]