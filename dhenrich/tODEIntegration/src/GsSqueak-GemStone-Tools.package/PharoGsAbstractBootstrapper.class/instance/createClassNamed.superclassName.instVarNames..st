class creation
createClassNamed: className superclassName: superclassName instVarNames: instVarNames
  ^ self
    createClassNamed: className
    superclassName: superclassName
    instVarNames: instVarNames
    classVars: #()
    classInstVars: #()