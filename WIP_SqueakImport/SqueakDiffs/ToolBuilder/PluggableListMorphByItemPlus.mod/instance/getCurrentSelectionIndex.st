model access
getCurrentSelectionIndex
	"Answer the index of the current selection."
	| item |
	getIndexSelector == nil ifTrue: [^ 0].
	item := model perform: getIndexSelector.
	^ itemList findFirst: [ :x | x = item]
