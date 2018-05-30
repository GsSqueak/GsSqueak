as yet unclassified
morphAsPostscript: aMorph rotated: rotateFlag offsetBy: offset specs: specsOrNil 
	self reset.
	psBounds := offset extent: aMorph bounds extent.
	topLevelMorph := aMorph.
	self writeHeaderRotated: rotateFlag.
	self fullDrawMorph: aMorph.
	^ self close