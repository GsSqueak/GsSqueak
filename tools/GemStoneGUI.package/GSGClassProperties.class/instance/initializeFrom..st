initialize-release
initializeFrom: aClass

	| instanceSide classSide |
	instanceSide := aClass theNonMetaClass.
	classSide := aClass theMetaClass.
	self
		name: instanceSide name asSymbol;
		superclassName: instanceSide superclassName asSymbol;
		category: instanceSide category asSymbol;
		instVarNames: (instanceSide instVarNames collect: [:var | var asSymbol]);
		classVarNames: (instanceSide classVarNames collect: [:var | var asSymbol]);
		classInstVarNames: (classSide instVarNames collect: [:var | var asSymbol]);
		typeOfClass: instanceSide typeOfClass;
		poolDictionaryNames: instanceSide poolDictionaryNames;
		commentString: instanceSide commentString;
		commentStamp: instanceSide commentStamp