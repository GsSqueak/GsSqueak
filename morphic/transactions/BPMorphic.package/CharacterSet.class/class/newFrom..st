instance creation
newFrom: aCollection 
	| _gsSqueakTemp_newCollection |
	_gsSqueakTemp_newCollection := self new.
	_gsSqueakTemp_newCollection addAll: aCollection.
	^ _gsSqueakTemp_newCollection