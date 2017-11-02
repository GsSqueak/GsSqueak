global lookup
classOrganizer
  | symList |
  symList := SymbolList new
    add: (self symbolList objectNamed: 'Smalltalk');
    yourself.
  ^ ClassOrganizer
    _newWithRoot: (self globalNamed: 'ProtoObject')
    symbolList: symList
    env: self classLookupEnvironmentId