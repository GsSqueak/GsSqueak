class creation
createClassNamed: className superclassName: superclassName instVarNames: instVarNames classVars: classVars
  ^ self
    createClassNamed: className
    superclassName: superclassName
    instVarNames: instVarNames
    classVars: classVars
    classInstVars: #()