costume
rememberCostume: aCostume 
	"Put aCostume in my remembered-costumes list, as the final element"
	| _gsSqueakTemp_costumeToRemember _gsSqueakTemp_existing |
	_gsSqueakTemp_costumeToRemember := aCostume renderedMorph.
	"Remember real morphs, not their transformations"
	costumes
		ifNil: [costumes := OrderedCollection new].
	_gsSqueakTemp_existing := _gsSqueakTemp_costumeToRemember isSketchMorph
				ifTrue: [self knownSketchCostumeWithSameFormAs: _gsSqueakTemp_costumeToRemember]
				ifFalse: [costumes
						detect: [:c | c == _gsSqueakTemp_costumeToRemember]
						ifNone: []].
	costumes := costumes copyWithout: _gsSqueakTemp_existing.
	costumes addLast: _gsSqueakTemp_costumeToRemember