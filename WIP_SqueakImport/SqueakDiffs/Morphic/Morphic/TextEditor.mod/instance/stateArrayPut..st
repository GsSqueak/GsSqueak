initialize-release
stateArrayPut: stateArray
	| sel |
	ChangeText := stateArray at: 1.
	FindText := stateArray at: 2.
	history := stateArray at: 3.
	sel := stateArray at: 4.
	self selectFrom: sel first to: sel last.
	beginTypeInIndex := stateArray at: 5.
	emphasisHere := stateArray at: 6