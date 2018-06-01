interface
templateForSubclassOf: className category: category

	| query |
	self flag: #gsg. "Very fragile and not environment-specific"
	query := '[:superclass :category |
	| aClass anArray dictionaryName str user |
	user := System myUserProfile.
	aClass := user symbolList objectNamed: superclass asString asSymbol.
	anArray := user dictionaryAndSymbolOf: aClass.
	dictionaryName := (anArray == nil
		or: [ (anArray at: 1) == GsPackagePolicy current homeSymbolDict ])
		ifTrue: [ '''' ]
		ifFalse: [ 
			anArray := user dictionaryAndSymbolOf: (anArray at: 1).
			(anArray == nil or: [ (anArray at: 2) == #''Globals'' ])
				ifTrue: [ '''' ]
				ifFalse: [ (anArray at: 2) asString ] ].
		(str := superclass asString)
		add: '' subclass: ''''NameOfSubclass'''''';
		lf.
		aClass isBytes
		ifFalse: [ 
			str
				add: ''    instVarNames: #()'';
				lf ].
	str
		add: ''    classVars: #()
		classInstVars: #()
		poolDictionaries: #()
		inDictionary: '';
		add: dictionaryName printString;
		add: ''
		category: '''''';
		add: category asString;
		add: $'';
		add:
				''
		options: #() ''.
	str] value: ({1}) value: {2}'
		format: {
			className storeString.
			category storeString}.
	^ self repository fetchString: query