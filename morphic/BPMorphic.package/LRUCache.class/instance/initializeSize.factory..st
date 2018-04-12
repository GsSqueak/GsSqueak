initialization
initializeSize: anInteger factory: aBlock 
	"initialize the receiver's size and factory"
	anInteger strictlyPositive
		ifFalse: [self error: 'Size must be at least 1'].
	size := anInteger.
	head := LRUCacheHeadNode new.
	map := PluggableDictionary integerDictionary.
	factory := aBlock.
	calls := 0.
	hits := 0