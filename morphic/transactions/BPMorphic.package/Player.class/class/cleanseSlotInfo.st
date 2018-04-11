housekeeping
cleanseSlotInfo
	| _gsSqueakTemp_newInfo |
	slotInfo
		ifNotNil: [_gsSqueakTemp_newInfo := IdentityDictionary new.
			slotInfo
				associationsDo: [:assoc | _gsSqueakTemp_newInfo at: assoc key asSymbol put: assoc value].
			slotInfo := _gsSqueakTemp_newInfo]