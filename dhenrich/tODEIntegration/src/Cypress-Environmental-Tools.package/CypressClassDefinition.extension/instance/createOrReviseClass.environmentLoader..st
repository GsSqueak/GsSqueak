*cypress-environmental-tools
createOrReviseClass: aSymbolDictionaryName environmentLoader: environmentLoader
  ^ self subclassType = ''
    ifTrue: [ 
      self
        createOrReviseRegularClass: aSymbolDictionaryName
        environmentLoader: environmentLoader ]
    ifFalse: [ 
      self subclassType = 'byteSubclass'
        ifTrue: [ 
          self
            createOrReviseByteClass: aSymbolDictionaryName
            environmentLoader: environmentLoader ]
        ifFalse: [ 
          self subclassType = 'indexableSubclass'
            ifTrue: [ 
              self
                createOrReviseIndexableClass: aSymbolDictionaryName
                environmentLoader: environmentLoader ]
            ifFalse: [ self error: 'unknown subclass type: ' , self subclassType printString ] ] ]