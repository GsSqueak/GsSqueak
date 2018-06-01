costume
sendMessageToCostume: aSelector with: arg 
	(self costumeRespondingTo: aSelector)
		ifNotNil: [:_gsSqueakTemp_aCostume | ^ _gsSqueakTemp_aCostume perform: aSelector with: arg].
	^ nil