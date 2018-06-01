slot getters/setters
getFirstElement
	"Answer a player representing the receiver's costume's first submorph"
	| _gsSqueakTemp_itsMorphs |
	^ (_gsSqueakTemp_itsMorphs := costume submorphs) notEmpty
		ifTrue: [_gsSqueakTemp_itsMorphs first assuredPlayer]
		ifFalse: [costume presenter standardPlayer]