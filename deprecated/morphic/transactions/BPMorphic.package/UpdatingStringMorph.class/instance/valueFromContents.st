accessing
valueFromContents
	"Return a new value from the current contents string."
	"
	| expression tilePadMorphOrNil asNumberBlock |
	asNumberBlock := [:string | [string asNumber]
	on: Error
	do: []].
	format = #string
	ifTrue: [^ contents].
	(format = #default
	and: [self owner isKindOf: NumericReadoutTile])
	ifTrue: [^ asNumberBlock value: contents].
	tilePadMorphOrNil := self ownerThatIsA: TilePadMorph.
	(tilePadMorphOrNil notNil
	and: [tilePadMorphOrNil type = #Number])
	ifTrue: [^ asNumberBlock value: contents].
	expression := Vocabulary eToyVocabulary translationKeyFor: contents.
	expression isNil
	ifTrue: [expression := contents].
	^ Compiler evaluate: expressio
	"
	format = #symbol
		ifTrue: [^ lastValue].
	format = #string
		ifTrue: [^ contents].
	(owner notNil
			and: [owner isNumericReadoutTile])
		ifTrue: [^ Number readFrom: contents].
	target
		ifNotNil: [target owner
				ifNotNil: [(target owner isTilePadMorph
							and: [target owner type = #Number])
						ifTrue: [^ Number readFrom: contents]]].
	^ Compiler evaluate: contents