interface 2
createIndexableClass: className superclass: superclassName instVars: instVarArray classVars: classVarArray classInstVars: classInstVarArray poolDictionaries: poolDictionaryArray category: categorySymbol

	^ self
		createClass: className
		type: #indexable
		superclass: superclassName
		instVars: instVarArray
		classVars: classVarArray
		classInstVars: classInstVarArray
		poolDictionaries: poolDictionaryArray
		category: categorySymbol