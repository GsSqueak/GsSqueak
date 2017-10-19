class creation
createIndexableClassNamed: className superclassName: superclassName instVarNames: instVarNames classVars: classVars classInstVars: classInstVars
  ^ self
    createClass: ' indexableSubclass: '
    named: className
    superclassName: superclassName
    instVarNames: instVarNames
    classVars: classVars
    classInstVars: classInstVars