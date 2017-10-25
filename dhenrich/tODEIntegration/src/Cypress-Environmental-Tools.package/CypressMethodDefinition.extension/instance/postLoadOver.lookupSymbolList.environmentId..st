*cypress-environmental-tools
postLoadOver: aDefinition lookupSymbolList: lookupSymbolList environmentId: environmentId
  super
    postLoadOver: aDefinition
    lookupSymbolList: lookupSymbolList
    environmentId: environmentId.
  (self isInitializer
    and: [ aDefinition isNil or: [ self source ~= aDefinition source ] ])
    ifTrue: [ 
      (self theNonMetaClass: lookupSymbolList)
        perform: #'initialize'
        env: environmentId ]