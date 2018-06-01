slots-user
slotNamesOfType: aType 
	"Answer a list of potential slot names of the given type in the receiver"
	| _gsSqueakTemp_fullList _gsSqueakTemp_forViewer _gsSqueakTemp_gettersToOffer |
	_gsSqueakTemp_fullList := (ScriptingSystem systemSlotNamesOfType: aType)
				, (self class slotGettersOfType: aType).
	_gsSqueakTemp_forViewer := costume renderedMorph selectorsForViewer
				select: [:aSel | aSel beginsWith: 'get'].
	_gsSqueakTemp_gettersToOffer := _gsSqueakTemp_fullList
				select: [:anItem | _gsSqueakTemp_forViewer includes: anItem].
	^ _gsSqueakTemp_gettersToOffer
		collect: [:aSel | aSel inherentSelector]