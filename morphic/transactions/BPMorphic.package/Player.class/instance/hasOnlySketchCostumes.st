costume
hasOnlySketchCostumes
	"Answer true if the only costumes assocaited with this Player are
	SketchMorph costumes"
	self
		costumesDo: [:aCostume | aCostume isSketchMorph
				ifFalse: [^ false]].
	^ true