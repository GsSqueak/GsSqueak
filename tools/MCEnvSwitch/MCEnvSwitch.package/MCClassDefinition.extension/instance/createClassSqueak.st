*MCEnvSwitch
createClassSqueak
  | aClass ivArray cvArray civArray poolArray newClass ty opts dict |
  aClass := (Smalltalk at: #'SqueakEnvironment') classNamed: superclassName.
  (aClass == nil and: [ superclassName asString ~= 'nil' ])
    ifTrue: [ self error: 'non-existent superclass' ].
  ivArray := (self instanceVariablesString findTokens: ' ') asArray.
  cvArray := (self classVariablesString findTokens: ' ') asArray.
  civArray := (self classInstanceVariablesString findTokens: ' ') asArray.
  poolArray := aClass
    ifNotNil: [ 
      (self sharedPoolsString findTokens: ' ') asArray
        collect: [ :each | | global |
          global := ((Smalltalk at: #SqueakEnvironment) at: each asSymbol).
          (global isKindOf: SharedPool) ifTrue: [
            global := global _classVars ].
          global ] ]
    ifNil: [ #() ].
  newClass := nil.
  opts := #().
  (ty := self type) _isArray
    ifTrue: [ 
      opts := ty at: 2.
      ty := ty at: 1 ].
  dict := SymbolDictionary new.
  ty == #'normal'
    ifTrue: [ 
      (newClass := aClass
        subclass: name
        instVarNames: ivArray
        classVars: cvArray
        classInstVars: civArray
        poolDictionaries: poolArray
        inDictionary: dict
        newVersionOf: nil
        description: nil
        options: opts) category: category ]
    ifFalse: [ 
      ty == #'variable'
        ifTrue: [ 
          (newClass := aClass
            indexableSubclass: name
            instVarNames: ivArray
            classVars: cvArray
            classInstVars: civArray
            poolDictionaries: poolArray
            inDictionary: dict
            newVersionOf: nil
            description: nil
            options: opts) category: category ]
        ifFalse: [ 
          ty == #'bytes'
            ifTrue: [ 
              (newClass := aClass
                byteSubclass: name
                classVars: cvArray
                classInstVars: civArray
                poolDictionaries: poolArray
                newVersionOf: nil
                description: nil
                inDictionary: dict
                options: opts) category: category ]
            ifFalse: [ 
              ty == #'words'
                ifTrue: [ 
                  (newClass := aClass
                    byteSubclass: name
                    classVars: cvArray
                    classInstVars: civArray
                    poolDictionaries: poolArray
                    inDictionary: dict
                    newVersionOf: nil
                    description: nil
                    options: #(#'4byteWords')) category: category ] ] ] ].
  newClass ifNil: [ ^ self error: 'Unrecognized class type ' , ty ].	"pre GLASS.230-dkh.196+ versions need this call to _resolveUndeclaredSymbolsForClass: included."
  (Smalltalk at: #'SqueakEnvironment') at: name asSymbol put: newClass.
  SystemChangeNotifier uniqueInstance
    doSilently: [ Class _resolveUndeclaredSymbolsForClass: newClass ].
  ^ newClass
