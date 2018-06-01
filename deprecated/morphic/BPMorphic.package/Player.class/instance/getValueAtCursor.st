slot getters/setters
getValueAtCursor
	| _gsSqueakTemp_anObject |
	_gsSqueakTemp_anObject := self getValueFromCostume: #valueAtCursor.
	^ _gsSqueakTemp_anObject == 0
		ifFalse: [_gsSqueakTemp_anObject assuredPlayer]