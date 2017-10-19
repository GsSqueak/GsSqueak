class creation
createClassNamed: className superclassName: superclassName
  ^ self
    createClassNamed: className
    superclassName: superclassName
    instVarNames: #()
    classVars: #()
    classInstVars: #()