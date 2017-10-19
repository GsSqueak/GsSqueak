class creation
createClass: classCreationArg named: className superclassName: superclassName instVarNames: instVarNames classVars: classVars classInstVars: classInstVars
  | strm |
  strm := WriteStream on: String new.
  strm
    nextPutAll: superclassName , classCreationArg , className printString;
    tab;
    nextPutAll: 'instVarNames: ' , instVarNames squeakPrintString;
    tab;
    nextPutAll: 'classVars: ' , classVars squeakPrintString;
    tab;
    nextPutAll: 'classInstVars: ' , classInstVars squeakPrintString;
    tab;
    nextPutAll: 'poolDictionaries: #()';
    tab;
    nextPutAll: 'inDictionary: Smalltalk';
    tab;
    nextPutAll: 'options: #()';
    yourself.
  ^ self executeForClassCreation: strm contents