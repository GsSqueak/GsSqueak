class deps
classDepsSelection
	"Class dependency selection"
	^(self classDepsIndex between: 1 and: self classDeps size)
		ifTrue:[self classDeps at: self classDepsIndex].