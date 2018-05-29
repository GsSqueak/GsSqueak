drag and drop
wantsMessageCategoriesDrop: anObject
	"Only accept drops of compiled methods on system categories"
	^anObject isKindOf: CompiledMethod