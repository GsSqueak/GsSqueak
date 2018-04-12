serialization
serializeCollection: collectionCreationCode elementTransformation: transformationCode

	^ '[:collectionToSerialize |
	| serializedCollection isFirst |
	isFirst := true.
	serializedCollection := String new.
	collectionToSerialize do: [:elementToSerialize |
		| transformedElement |
		isFirst
			ifTrue: [isFirst := false]
			ifFalse: [serializedCollection add: Character lf].
		transformedElement := (elementToSerialize ' , transformationCode , ') asString.
		serializedCollection addAll: transformedElement].
	serializedCollection] value: (' , collectionCreationCode , ')'.