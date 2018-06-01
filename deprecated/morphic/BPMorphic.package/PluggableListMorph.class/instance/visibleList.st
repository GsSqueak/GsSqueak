accessing
visibleList
	^ list isEmptyOrNil
		ifTrue: [Array empty]
		ifFalse: [list
				copyFrom: self topVisibleRowIndex
				to: (self bottomVisibleRowIndex min: list size)]