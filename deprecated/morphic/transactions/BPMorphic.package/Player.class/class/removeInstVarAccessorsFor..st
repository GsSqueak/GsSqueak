slots
removeInstVarAccessorsFor: varName 
	| _gsSqueakTemp_nameString |
	_gsSqueakTemp_nameString := varName asString capitalized.
	self removeSelector: ('get' , _gsSqueakTemp_nameString) asSymbol.
	self removeSelector: ('set' , _gsSqueakTemp_nameString , ':') asSymbol