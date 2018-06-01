costume
setCostumeSlot: setterSelector toValue: aValue 
	(self costumeRespondingTo: setterSelector)
		ifNotNil: [:_gsSqueakTemp_aCostume | _gsSqueakTemp_aCostume perform: setterSelector with: aValue]