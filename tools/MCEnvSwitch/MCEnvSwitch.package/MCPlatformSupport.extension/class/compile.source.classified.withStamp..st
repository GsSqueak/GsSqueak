*MCEnvSwitch
compile: aClass source: monticelloSource classified: cat withStamp: aString
  | source errString |
  source := monticelloSource withGemstoneLineEndings.
  errString := aClass compileMethod: source category: cat env: MCEnv current.
  errString
    ifNil: [ aClass setStamp: aString forMethod: (Behavior parseSelector: source for: aClass) ]
    ifNotNil: [ 
      self gemToolsActive
        ifFalse: [ 
          | str |
          (str := 'ERROR - method compile failed' copy)
            lf;
            add: 'category: ';
            add: $';
            add: cat;
            add: $';
            lf.
          aClass isMeta
            ifTrue: [ str add: 'class' ].
          str
            add: 'method: ';
            add: aClass theNonMetaClass name;
            lf;
            add: errString;
            lf;
            add: '! ----------------- ';
            lf.
          GsFile gciLogClient: str ] ]