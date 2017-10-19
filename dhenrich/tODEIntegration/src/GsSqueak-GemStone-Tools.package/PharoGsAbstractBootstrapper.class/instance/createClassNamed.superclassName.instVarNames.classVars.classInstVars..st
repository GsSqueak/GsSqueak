class creation
createClassNamed: className superclassName: superclassName instVarNames: instVarNames classVars: classVars classInstVars: classInstVars
  ^ self
    createClass: ' subclass: '
    named: className
    superclassName: superclassName
    instVarNames: instVarNames
    classVars: classVars
    classInstVars: classInstVars