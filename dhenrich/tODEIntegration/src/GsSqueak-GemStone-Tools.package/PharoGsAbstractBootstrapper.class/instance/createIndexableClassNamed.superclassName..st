class creation
createIndexableClassNamed: className superclassName: superclassName
  ^ self
    createClass: ' indexableSubclass: '
    named: className
    superclassName: superclassName
    instVarNames: #()
    classVars: #()
    classInstVars: #()