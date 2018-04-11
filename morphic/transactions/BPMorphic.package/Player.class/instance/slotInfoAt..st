slots-user
slotInfoAt: slotName 
	| _gsSqueakTemp_info |
	_gsSqueakTemp_info := self slotInfo
				at: slotName
				ifAbsent: [].
	_gsSqueakTemp_info
		ifNil: [self slotInfo at: slotName put: (_gsSqueakTemp_info := SlotInformation new)].
	_gsSqueakTemp_info isSymbol
		ifTrue: ["bkward compat"
			self slotInfo at: slotName put: (_gsSqueakTemp_info := SlotInformation new type: _gsSqueakTemp_info)].
	^ _gsSqueakTemp_info