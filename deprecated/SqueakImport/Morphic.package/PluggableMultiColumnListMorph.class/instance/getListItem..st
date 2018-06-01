selection
getListItem: index
	"get the index-th item in the displayed list"
	getListElementSelector ifNotNil: [ ^(model perform: getListElementSelector with: index) asStringOrText ].
	list ifNotNil: [ ^list first at: index ]. "this is a very trivial fix for the issue of having rows ofdata in the multiple columns. It is *not* a robust solution"
	^self getList at: index