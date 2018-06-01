model access
getList
	"Answer the list to be displayed. Caches the returned list in the 'list'
	ivar "
	getListSelector == nil
		ifTrue: [^ Array empty].
	list := self getFullList.
	self filterableList
		ifTrue: [self filterList].
	^ list
		ifNil: [Array empty]