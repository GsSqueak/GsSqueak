*cypress-environmental-tools
loadMethodDefinition: lookupSymbolList compilationSymbolList: compilationSymbolList environmentId: environmentId
  | cls actualCls |
  cls := (lookupSymbolList resolveSymbol: self className) value.
  actualCls := self classIsMeta
    ifTrue: [ cls class ]
    ifFalse: [ cls ].
  actualCls
    compileMethod: self source
    dictionaries: compilationSymbolList
    category: self category
    environmentId: environmentId
