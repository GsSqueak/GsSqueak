debug support
allObjectsSelect: objBlock
	"self allObjectsSelect: [:oop | (self baseHeader: oop) = 1234]"

	^objectMemory allObjectsSelect: objBlock
