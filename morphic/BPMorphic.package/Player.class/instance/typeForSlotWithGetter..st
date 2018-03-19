slots-kernel
typeForSlotWithGetter: aGetter 
	"Answer the data type for values of the instance variable of the given
	name "
	| _gsSqueakTemp_getter _gsSqueakTemp_inherentSelector |
	(#(#color:sees: #seesColor: #touchesA: #overlaps: #overlapsAny: ) includes: aGetter)
		ifTrue: [^ #Boolean].
	(#(#+ #* #- #/ ) includes: aGetter)
		ifTrue: [^ #Player].
	"weird vector stuff"
	"Annoying special cases"
	_gsSqueakTemp_inherentSelector := aGetter inherentSelector.
	(self slotInfo includesKey: _gsSqueakTemp_inherentSelector)
		ifTrue: [^ (self slotInfoAt: _gsSqueakTemp_inherentSelector) type].
	_gsSqueakTemp_getter := (aGetter beginsWith: 'get')
				ifTrue: [aGetter]
				ifFalse: [aGetter asGetterSelector].
	^ (Vocabulary eToyVocabulary
		methodInterfaceAt: _gsSqueakTemp_getter
		ifAbsent: [self error: 'Unknown slot name: ' , aGetter]) resultType