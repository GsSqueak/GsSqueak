query
allClassesDo: aBlock
	"currently returns all the classes defined in Smalltalk but could be customized 
	for dealing with environments and  in such a case would work on really all the classes"

	^ self environment allClassesDo: aBlock

	