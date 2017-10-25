*cypress-environmental-tools
loadClassDefinition: aSymbolDictionaryName lookupSymbolList: lookupSymbolList compilationSymbolList: compilationSymbolList
  "Create a new version of the defined class. If the class already exists,
	 copy the behaviors and state from the old version."

  | newClass oldClass |
  self defaultSymbolDictionaryName: aSymbolDictionaryName.
  (lookupSymbolList resolveSymbol: self name)
    ifNotNil: [:assoc | oldClass := assoc value ].
  newClass := self
    createOrReviseClass: aSymbolDictionaryName
    symbolList: lookupSymbolList.
  (oldClass isNil or: [ newClass == oldClass ])
    ifTrue: [ ^ self ].
  self classNeedingMigration: newClass.
  self
    recompileWithSubclassesFrom: oldClass
    to: newClass
    symbolList: compilationSymbolList
