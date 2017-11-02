*cypress-environmental-tools
loadClassDefinition: aSymbolDictionaryName environmentLoader: environmentLoader
  "Create a new version of the defined class. If the class already exists,
	 copy the behaviors and state from the old version."

  | newClass oldClass lookupSymbolList |
  lookupSymbolList := environmentLoader lookupSymbolList.
  self defaultSymbolDictionaryName: aSymbolDictionaryName.
  (lookupSymbolList resolveSymbol: self name)
    ifNotNil: [ :assoc | oldClass := assoc value ].
  newClass := self
    createOrReviseClass: aSymbolDictionaryName
    environmentLoader: environmentLoader.
  (oldClass isNil or: [ newClass == oldClass ])
    ifTrue: [ ^ self ].
  self classNeedingMigration: newClass.
  self
    recompileWithSubclassesFrom: oldClass
    to: newClass
    environmentLoader: environmentLoader