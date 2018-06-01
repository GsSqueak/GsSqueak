preferences
draggableTextSelection: aBoolean

	DraggableTextSelection := aBoolean.
	
	TextMorphForEditView allInstancesDo: [:tm |
		tm dragEnabled: aBoolean; dropEnabled: aBoolean].