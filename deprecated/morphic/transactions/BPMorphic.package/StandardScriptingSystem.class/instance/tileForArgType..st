-Etoys-utilities
tileForArgType: aType 
	"Anwer a default tile to represent a datum of the given argument type,
	which may be either a symbol (e.g. #Color) or a class"
	(aType isKindOf: Class)
		ifTrue: ["Allowed in Ted's work"
			^ aType name asString newTileMorphRepresentative typeColor: Color gray].
	^ (Vocabulary vocabularyForType: aType) defaultArgumentTile