slots
slotGettersOfType: aType 
	"Answer a list of gettter selectors for slots of mine of the given type"
	| _gsSqueakTemp_aList |
	_gsSqueakTemp_aList := OrderedCollection new.
	self slotInfo
		associationsDo: [:assoc | assoc value type = aType
				ifTrue: [_gsSqueakTemp_aList add: assoc key asGetterSelector]].
	^ _gsSqueakTemp_aList