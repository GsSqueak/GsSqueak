slots-user
renameSlot: oldSlotName 
	| _gsSqueakTemp_reply _gsSqueakTemp_newSlotName |
	_gsSqueakTemp_reply := UIManager default request: 'New name for "' translated , oldSlotName , '":' initialAnswer: oldSlotName.
	_gsSqueakTemp_reply isEmpty
		ifTrue: [^ self].
	_gsSqueakTemp_newSlotName := ScriptingSystem
				acceptableSlotNameFrom: _gsSqueakTemp_reply
				forSlotCurrentlyNamed: oldSlotName
				asSlotNameIn: self
				world: self costume currentWorld.
	self renameSlot: oldSlotName newSlotName: _gsSqueakTemp_newSlotName