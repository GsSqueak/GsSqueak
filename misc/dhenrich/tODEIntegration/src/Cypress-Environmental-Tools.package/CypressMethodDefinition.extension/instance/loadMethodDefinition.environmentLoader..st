*cypress-environmental-tools
loadMethodDefinition: lookupSymbolList environmentLoader: environmentLoader
  | cls actualCls |
  cls := (lookupSymbolList resolveSymbol: self className) value.
  actualCls := self classIsMeta
    ifTrue: [ cls class ]
    ifFalse: [ cls ].
  actualCls
    compileMethod: self source
    dictionaries: environmentLoader compilationSymbolList
    category: self category
    environmentId: environmentLoader defaultEnvironmentId