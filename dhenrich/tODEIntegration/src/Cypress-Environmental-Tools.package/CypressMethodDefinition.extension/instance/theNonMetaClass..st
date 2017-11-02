*cypress-environmental-tools
theNonMetaClass: lookupSymbolList
  ^ self
    resolveGlobalNamed: self className
    lookupSymbolList: lookupSymbolList
    or: [  ]