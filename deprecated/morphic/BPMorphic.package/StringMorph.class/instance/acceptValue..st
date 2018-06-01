editing
acceptValue: aValue 
	| _gsSqueakTemp_val |
	self contents: (_gsSqueakTemp_val := aValue asString).
	^ _gsSqueakTemp_val