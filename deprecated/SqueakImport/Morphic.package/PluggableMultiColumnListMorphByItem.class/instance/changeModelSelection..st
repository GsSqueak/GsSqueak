model access
changeModelSelection: anInteger 
	"Change the model's selected item to be the one at the given index."
	| item |
	setIndexSelector
		ifNotNil: [item := anInteger = 0
						ifFalse: [list first at: anInteger].
			model perform: setIndexSelector with: item].
	self update: getIndexSelector