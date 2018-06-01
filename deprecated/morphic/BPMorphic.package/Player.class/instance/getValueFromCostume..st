costume
getValueFromCostume: aSelector 
	(self costumeRespondingTo: aSelector)
		ifNotNil: [:_gsSqueakTemp_aCostume | ^ _gsSqueakTemp_aCostume perform: aSelector].
	^ nil