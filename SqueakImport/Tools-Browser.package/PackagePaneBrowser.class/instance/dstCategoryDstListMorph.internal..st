dragNDrop util
dstCategoryDstListMorph: dstListMorph internal: internal 
	| dropItem |
	^ internal & (dstListMorph getListSelector == #systemCategoryList)
		ifTrue: [(dropItem := dstListMorph potentialDropItem) ifNotNil: [(self package , '-' , dropItem) asSymbol]]
		ifFalse: [self selectedSystemCategory]