copying
usableSiblingInstance
	"Return another similar morph whose Player is of the same class as mine.
	Do not open it in the world."

	| aName newPlayer newMorph topRenderer counter world |
	(topRenderer := self topRendererOrSelf) == self 
		ifFalse: [^topRenderer usableSiblingInstance].
	self assuredPlayer assureUniClass.
	newMorph := self veryDeepCopySibling.
	newPlayer := newMorph player.
	newPlayer resetCostumeList.
	(aName := self knownName) isNil 
		ifTrue: [self player notNil ifTrue: [aName := newMorph innocuousName]].
	"Force a difference here"

	aName := aName stemAndNumericSuffix at: 1. 
	
	world := self world ifNil: [Project current world].
	(world hasProperty: #nameCounter) ifFalse: [
		(world setProperty: #nameCounter toValue: Dictionary new)
	].

	counter := (world valueOfProperty: #nameCounter) at: aName ifAbsent: [1].
	newMorph setNameTo: aName, counter.
	(world valueOfProperty: #nameCounter)  at: aName put: counter + 1.

	newMorph privateOwner: nil.
	newPlayer assureEventHandlerRepresentsStatus.
	self presenter flushPlayerListCache.
	^newMorph