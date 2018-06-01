slots-user
chooseUserSlot
	| _gsSqueakTemp_names _gsSqueakTemp_result |
	(_gsSqueakTemp_names := self slotNames) size = 1
		ifTrue: [^ _gsSqueakTemp_names first].
	_gsSqueakTemp_result := UIManager default
				chooseFrom: _gsSqueakTemp_names
				values: _gsSqueakTemp_names
				title: 'Please choose a variable'.
	_gsSqueakTemp_result isEmptyOrNil
		ifTrue: [^ nil].
	^ _gsSqueakTemp_result