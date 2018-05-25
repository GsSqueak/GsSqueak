*SqClasses-adding/removing methods
basicRemoveSelector: selector 
	"Assuming that the argument, selector (a Symbol), is a message selector 
	in my method dictionary, remove it and its method. Returns the old method
	if found, nil otherwise."

	| oldMethod |
	oldMethod := self methodDict at: selector ifAbsent: [^ nil].
	self methodDict removeKey: selector.

	"Now flush Squeak's method cache for this selector"
	selector flushCache.
	^oldMethod
