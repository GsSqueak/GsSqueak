private actions
deselectAllBetweenLastSelectionAnd: indexPosition

	| lower higher |
	lower := messageListIndex min: indexPosition.
	higher := messageListIndex max: indexPosition.
	lower = 0 ifTrue: [ ^nil ].
	lower to: higher do:
		[ :index | messageSelections at: index put: false ]
