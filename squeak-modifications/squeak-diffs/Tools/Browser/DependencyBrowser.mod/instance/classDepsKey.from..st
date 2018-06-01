class deps
classDepsKey: aCharacter from: aPluggableListMorphPlus 
	aCharacter = $N ifTrue: [^ self referencesToIt: (self classDeps at: self classDepsIndex)].