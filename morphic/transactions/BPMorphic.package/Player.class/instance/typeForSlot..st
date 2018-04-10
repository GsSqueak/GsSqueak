slots-kernel
typeForSlot: aSlotName 
	"Answer the data type for values of the instance variable of the given
	name "
	| _gsSqueakTemp_getter |
	(self slotInfo includesKey: aSlotName)
		ifTrue: [^ (self slotInfoAt: aSlotName) type].
	_gsSqueakTemp_getter := (aSlotName beginsWith: 'get')
				ifTrue: [aSlotName]
				ifFalse: [aSlotName asGetterSelector].
	^ (self currentVocabulary
		methodInterfaceAt: _gsSqueakTemp_getter
		ifAbsent: [self error: 'Unknown slot name: ' , aSlotName]) resultType