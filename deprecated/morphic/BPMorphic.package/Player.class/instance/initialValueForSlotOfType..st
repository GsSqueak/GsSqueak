slots-user
initialValueForSlotOfType: aType 
	"Answer the default initial value to ascribe to a slot of the given type"
	^ (Vocabulary vocabularyForType: aType)
		initialValueForASlotFor: self