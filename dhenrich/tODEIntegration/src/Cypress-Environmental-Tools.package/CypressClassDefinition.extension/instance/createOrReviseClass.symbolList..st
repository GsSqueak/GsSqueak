*gssqueak-gemstone-tools
createOrReviseClass: aSymbolDictionaryName symbolList: aSymbolList
  ^ self subclassType = ''
    ifTrue: [ self createOrReviseRegularClass: aSymbolDictionaryName symbolList: aSymbolList ]
    ifFalse: [ self subclassType = 'byteSubclass'
        ifTrue: [ self createOrReviseByteClass: aSymbolDictionaryName symbolList: aSymbolList ]
        ifFalse: [ self subclassType = 'indexableSubclass'
            ifTrue: [ self createOrReviseIndexableClass: aSymbolDictionaryName symbolList: aSymbolList ]
            ifFalse: [ self error: 'unknown subclass type: ' , self subclassType printString ] ] ]
