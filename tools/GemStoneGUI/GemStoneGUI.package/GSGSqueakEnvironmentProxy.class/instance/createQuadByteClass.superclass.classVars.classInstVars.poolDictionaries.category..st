interface 2
createQuadByteClass: className superclass: superclassName classVars: classVarArray classInstVars: classInstVarArray poolDictionaries: poolDictionaryArray category: categorySymbol

	^ self
		createClass: className
		type: #quadByte
		superclass: superclassName
		instVars: #()
		classVars: classVarArray
		classInstVars: classInstVarArray
		poolDictionaries: poolDictionaryArray
		category: categorySymbol