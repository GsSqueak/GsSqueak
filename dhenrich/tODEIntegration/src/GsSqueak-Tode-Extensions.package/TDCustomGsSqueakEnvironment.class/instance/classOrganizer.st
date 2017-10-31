global lookup
classOrganizer
  ^ ClassOrganizer
    _newWithRoot: (self globalNamed: 'ProtoObject')
    symbolList: self symbolList
    env: self classLookupEnvironmentId