initialize-release
stateArrayPut: stateArray 
	| _gsSqueakTemp_sel |
	ChangeText := stateArray at: 1.
	FindText := stateArray at: 2.
	history := stateArray at: 3.
	_gsSqueakTemp_sel := stateArray at: 4.
	self selectFrom: _gsSqueakTemp_sel first to: _gsSqueakTemp_sel last.
	beginTypeInIndex := stateArray at: 5.
	emphasisHere := stateArray at: 6