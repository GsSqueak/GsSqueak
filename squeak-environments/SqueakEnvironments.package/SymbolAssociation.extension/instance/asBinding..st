*SqueakEnvironments
asBinding: aSymbol
  ^ aSymbol == key
    ifTrue: [ self ]
    ifFalse: [ Alias key: aSymbol source: self ]