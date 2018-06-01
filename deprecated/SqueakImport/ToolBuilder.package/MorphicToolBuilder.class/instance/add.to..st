private
add: aMorph to: aParent
	
	aMorph layoutFrame
		ifNotNil: [aParent addMorph: aMorph fullFrame: aMorph layoutFrame]
		ifNil: [aParent addMorphBack: aMorph].