api
templateForSubclassOf: class category: category

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: '[:superclass :category |
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
  str] value: (' , class , ') value: ''' , category , $'.
	^ topazOutput at: 1