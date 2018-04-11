costume
costumesDo: aBlock 
	"Evaluate aBlock against every real (not flex) costume known to the
	receiver, starting with the current costume."
	costume
		ifNotNil: [aBlock value: costume renderedMorph].
	costumes
		ifNil: [^ self].
	costumes
		do: [:aCostume | aCostume ~~ costume
				ifTrue: [aBlock value: aCostume renderedMorph]]