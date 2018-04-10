private
add: aMorph to: aParent 
	aMorph layoutFrame
		ifNil: [aParent addMorphBack: aMorph]
		ifNotNil: [aParent addMorph: aMorph fullFrame: aMorph layoutFrame]