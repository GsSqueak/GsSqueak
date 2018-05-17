interface 2
createNormalClass: className superclass: superclassName instVars: instVarArray classVars: classVarArray classInstVars: classInstVarArray poolDictionaries: poolDictionaryArray category: categorySymbol

	^ self
		createClass: className
		type: #normal
		superclass: superclassName
		instVars: instVarArray
		classVars: classVarArray
		classInstVars: classInstVarArray
		poolDictionaries: poolDictionaryArray
		category: categorySymbol