api
allSelectorsFor: class classSide: isClassSide env: envId

	| topazOutput |
	self setClass: class.
	self setEnv: envId.
	topazOutput := isClassSide
						ifTrue: [self listClassSelectors]
						ifFalse: [self listInstanceSelectors].
	^ self convertToSymbolList: (topazOutput at: 1)