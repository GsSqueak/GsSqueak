menu
addCustomMenuItems: aMenu hand: aHandMorph

	super addCustomMenuItems: aMenu hand: aHandMorph.
	aMenu add: 'expand time' translated action: #expandTime.
	aMenu add: 'contract time' translated action: #contractTime.
	aMenu addLine.
	aMenu add: 'add movie clip player' translated action: #addMovieClipPlayer.
	(self valueOfProperty: #dragNDropEnabled) == true
		ifTrue: [aMenu add: 'close drag and drop' translated action: #disableDragNDrop]
		ifFalse: [aMenu add: 'open drag and drop' translated action: #enableDragNDrop].
