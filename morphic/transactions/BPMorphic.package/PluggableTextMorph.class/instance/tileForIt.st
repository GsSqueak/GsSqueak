menu commands
tileForIt
	"Return a tile referring to the object resulting form evaluating my
	current selection. Not currently threaded in, but useful in earlier
	demos and possibly still of value."
	self
		handleEdit: [textMorph editor
				evaluateSelectionAndDo: [:result | self currentHand attachMorph: result tileToRefer]]