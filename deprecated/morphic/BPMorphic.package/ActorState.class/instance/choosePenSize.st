pen
choosePenSize
	| _gsSqueakTemp_sz |
	_gsSqueakTemp_sz := UIManager default
				chooseFrom: (1 to: 10)
				values: (1 to: 10).
	_gsSqueakTemp_sz
		ifNotNil: [penSize := _gsSqueakTemp_sz]