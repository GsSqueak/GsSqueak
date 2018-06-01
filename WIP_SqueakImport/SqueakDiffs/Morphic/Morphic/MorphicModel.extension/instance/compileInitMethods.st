*Morphic-MorphicExtras-compilation
compileInitMethods
	| s nodeDict varNames |
	nodeDict := IdentityDictionary new.
	s := WriteStream on: (String new: 2000).
	varNames := self class allInstVarNames.
	s nextPutAll: 'initMorph'.
	3 to: self class instSize do:
		[:i | (self instVarAt: i) isMorph ifTrue:
			[s cr; tab; nextPutAll: (varNames at: i) , ' := '.
			s nextPutAll: (self instVarAt: i) initString; nextPutAll: '.'.
			nodeDict at: (self instVarAt: i) put: (varNames at: i)]].
	submorphs do: 
		[:m | s cr; tab; nextPutAll: 'self addMorph: '.
		m printConstructorOn: s indent: 1 nodeDict: nodeDict.
		s nextPutAll: '.'].
	self class
		compile: s contents
		classified: 'initialization'
		notifying: nil.