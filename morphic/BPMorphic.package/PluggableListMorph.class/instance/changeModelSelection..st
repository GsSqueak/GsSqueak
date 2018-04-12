model access
changeModelSelection: anInteger 
	"Change the model's selected item index to be anInteger. Enable the
	pre selection highlight. Step the World forward to let the pre selection
	highlight take effect."
	self
		rowAboutToBecomeSelected: (self uiIndexFor: anInteger).
	self refreshWorld.
	setIndexSelector
		ifNotNil: [model perform: setIndexSelector with: anInteger]