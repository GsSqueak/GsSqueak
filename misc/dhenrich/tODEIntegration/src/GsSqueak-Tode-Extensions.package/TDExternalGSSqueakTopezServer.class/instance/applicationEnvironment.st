environment
applicationEnvironment
  "Answer the environment that should be used when working with the Smalltalk application (including the base class library)."

  "Use the todeEnvironment if one is explicitly working with tODE."

  sessionDescription
    ifNil: [ 
      "bootstrap: full defaultApplicationEnvironment requires sessionDescription to be defined"
      ^ TDCustomGsSqueakEnvironment new ].
  ^ super applicationEnvironment