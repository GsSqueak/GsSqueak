private actions
selectAllBetweenAnchorAnd: indexPosition

	| lower higher |
	self deselectAllBetweenLastSelectionAnd: indexPosition.
	anchorIndex ifNil: [ anchorIndex := indexPosition ].
	lower := anchorIndex min: indexPosition.
	higher := anchorIndex max: indexPosition.
	lower to: higher do:
		[ :index | messageSelections at: index put: true ]
