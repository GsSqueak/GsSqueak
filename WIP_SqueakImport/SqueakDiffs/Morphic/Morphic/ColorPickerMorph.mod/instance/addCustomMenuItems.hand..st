menu
addCustomMenuItems: aCustomMenu hand: aHandMorph

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	deleteOnMouseUp
		ifTrue: [aCustomMenu add: 'stay up' translated action: #toggleDeleteOnMouseUp]
		ifFalse: [aCustomMenu add: 'do not stay up' translated action: #toggleDeleteOnMouseUp].
	updateContinuously
		ifTrue: [aCustomMenu add: 'update only at end' translated action: #toggleUpdateContinuously]
		ifFalse: [aCustomMenu add: 'update continuously' translated action: #toggleUpdateContinuously].
