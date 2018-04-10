accessing
selectedButtonIndex
	^ self selectedButton
		ifNil: [0]
		ifNotNil: [:btn | self buttons indexOf: btn]