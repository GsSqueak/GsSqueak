slot getters/setters
getNewClone
	"Answer a new player of the same class as the receiver, with a
	costume much like mine"
	| _gsSqueakTemp_clone |
	_gsSqueakTemp_clone := costume usableSiblingInstance.
	costume pasteUpMorph
		ifNotNil: [:parent | parent addMorph: _gsSqueakTemp_clone].
	^ _gsSqueakTemp_clone player