slots-kernel
typeForSlot: aSlotName vocabulary: aVocabulary 
	"Answer the data type for values of the instance variable of the given
	name. Presently has no senders but retained for a while..."
	| _gsSqueakTemp_getter _gsSqueakTemp_inherentSelector |
	_gsSqueakTemp_inherentSelector := aSlotName inherentSelector.
	(self slotInfo includesKey: _gsSqueakTemp_inherentSelector)
		ifTrue: [^ (self slotInfoAt: _gsSqueakTemp_inherentSelector) type].
	_gsSqueakTemp_getter := (aSlotName beginsWith: 'get')
				ifTrue: [aSlotName]
				ifFalse: [aSlotName asGetterSelector].
	^ (aVocabulary
		methodInterfaceAt: _gsSqueakTemp_getter
		ifAbsent: [self error: 'Unknown slot name: ' , aSlotName]) resultType