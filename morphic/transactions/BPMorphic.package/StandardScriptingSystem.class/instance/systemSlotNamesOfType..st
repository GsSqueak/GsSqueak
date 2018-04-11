-Etoys-universal slots & scripts
systemSlotNamesOfType: aType 
	"Answer the type of the slot name, or nil if not found."
	| _gsSqueakTemp_aList |
	self flag: #deferred.
	"Hard-coded etoyVocabulary needed here to make this work."
	_gsSqueakTemp_aList := OrderedCollection new.
	Vocabulary eToyVocabulary
		methodInterfacesDo: [:anInterface | anInterface resultType = aType
				ifTrue: [_gsSqueakTemp_aList add: anInterface selector]].
	^ _gsSqueakTemp_aList