interface 2
createOctByteClass: className superclass: superclassName classVars: classVarArray classInstVars: classInstVarArray poolDictionaries: poolDictionaryArray category: categorySymbol

	^ self
		createClass: className
		type: #octByte
		superclass: superclassName
		instVars: #()
		classVars: classVarArray
		classInstVars: classInstVarArray
		poolDictionaries: poolDictionaryArray
		category: categorySymbol