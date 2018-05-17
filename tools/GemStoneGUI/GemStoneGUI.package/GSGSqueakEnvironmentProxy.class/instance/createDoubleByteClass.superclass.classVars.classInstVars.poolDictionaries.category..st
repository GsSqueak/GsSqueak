interface 2
createDoubleByteClass: className superclass: superclassName classVars: classVarArray classInstVars: classInstVarArray poolDictionaries: poolDictionaryArray category: categorySymbol

	^ self
		createClass: className
		type: #doubleByte
		superclass: superclassName
		instVars: #()
		classVars: classVarArray
		classInstVars: classInstVarArray
		poolDictionaries: poolDictionaryArray
		category: categorySymbol