model access
getList
	"fetch and answer the lists to be displayed"
	getListSelector == nil ifTrue: [^ #()].
	list := model perform: getListSelector.
	list == nil ifTrue: [^ #()].
	list := list collect: [ :column | column collect: [ :item | item asStringOrText ] ].
	^ list