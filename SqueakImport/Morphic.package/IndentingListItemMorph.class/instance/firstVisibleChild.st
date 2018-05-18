accessing
firstVisibleChild

	^ self firstChild ifNotNil: [:c |
		c visible ifTrue: [c] ifFalse: [c nextVisibleSibling]]