slots-kernel
methodInterfacesForInstanceVariablesCategoryIn: aVocabulary 
	"Return a collection of methodInterfaces for the instance-variables
	category. The vocabulary parameter, at present anyway, is not used."
	| _gsSqueakTemp_aList |
	_gsSqueakTemp_aList := OrderedCollection new.
	self slotInfo
		associationsDo: [:assoc | 
			| itsSlotName anInterface |
			anInterface := MethodInterface new.
			itsSlotName := assoc key.
			anInterface wording: itsSlotName;
				 helpMessage: 'a variable defined by this object' translated.
			anInterface
				selector: itsSlotName asGetterSelector
				type: assoc value type
				setter: itsSlotName asSetterSelector.
			anInterface setToRefetch.
			_gsSqueakTemp_aList add: anInterface].
	^ _gsSqueakTemp_aList