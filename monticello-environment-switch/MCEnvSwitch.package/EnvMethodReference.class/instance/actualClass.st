accessing
actualClass
  | actualClass |
  ((MCEnv respondsTo: #'usesSqueakParser') and: [ MCEnv usesSqueakParser ])
    ifFalse: [ ^ super actualClass ].
  actualClass := (Smalltalk at: #'SqueakEnvironment') classNamed: classSymbol.
  actualClass == nil
    ifTrue: [ ^ nil ].
  classIsMeta
    ifTrue: [ ^ actualClass class ].
  ^ actualClass