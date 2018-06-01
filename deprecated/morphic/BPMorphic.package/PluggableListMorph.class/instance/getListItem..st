model access
getListItem: index 
	"get the index-th item in the displayed list"
	getListElementSelector
		ifNotNil: [^ (model perform: getListElementSelector with: index) asStringOrText].
	list
		ifNotNil: [^ list at: index].
	^ self getList at: index