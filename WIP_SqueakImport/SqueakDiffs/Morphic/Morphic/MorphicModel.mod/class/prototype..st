prototype access
prototype: aMorph
	"Store a copy of the given morph as a prototype to be copied to make new instances."

	aMorph ifNil: [prototype := nil. ^ self].

	prototype := aMorph veryDeepCopy.
	(prototype isMorphicModel) ifTrue: 
		[prototype model: nil slotName: nil].
