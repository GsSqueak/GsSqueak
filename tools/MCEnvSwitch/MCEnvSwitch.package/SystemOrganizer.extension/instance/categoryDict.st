*MCEnvSwitch
categoryDict
  ^ ((MCEnv respondsTo: #'usesSqueakParser') and: [ MCEnv usesSqueakParser ])
    ifFalse: [ ClassOrganizer cachedOrganizer categories ]
    ifTrue: [ 
      | dict |
      dict := Dictionary new.
      (Smalltalk at: #'SqueakEnvironment')
        allClassesDo: [ :class | 
          | category classes |
          category := class category asSymbol.
          classes := dict at: category ifAbsentPut: [ IdentitySet new ].
          classes add: class ].
      dict collect: [ :classes | classes asArray ] ]