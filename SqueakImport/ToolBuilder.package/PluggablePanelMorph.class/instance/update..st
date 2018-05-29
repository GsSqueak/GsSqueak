update
update: selectorSymbolOrNil 
	selectorSymbolOrNil ifNil: [ ^ self ].
	selectorSymbolOrNil = getChildrenSelector ifTrue:
		[ self
			 removeAllMorphs ;
			 addAllMorphs: self children .
			
		"Let my children take all the place unless my extent is described by them."
		self hResizing ~~ #shrinkWrap ifTrue:
			[ self submorphsDo: [ : m | m hResizing: #spaceFill ] ].
		self vResizing ~~ #shrinkWrap ifTrue:
			[ self submorphsDo: [ : m | m vResizing: #spaceFill ] ].
		
		"Tell dependents about this update. There is no pluggable notification for changed submorphs."
		self changed: #submorphs ].