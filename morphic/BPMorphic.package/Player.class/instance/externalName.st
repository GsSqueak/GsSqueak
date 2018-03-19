viewer
externalName
	"Answer an external name for the receiver. If it has none, supply a
	backstop name"
	^ self costume
		ifNil: ['an orphaned Player']
		ifNotNil: [:_gsSqueakTemp_aCostume | _gsSqueakTemp_aCostume externalName]