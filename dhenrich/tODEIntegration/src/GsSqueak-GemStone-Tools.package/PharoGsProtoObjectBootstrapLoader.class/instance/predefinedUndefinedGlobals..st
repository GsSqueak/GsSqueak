undefined globals
predefinedUndefinedGlobals: aSymbolDictionary
  "noop by default"

  ^ aSymbolDictionary
    at: #'OrderedCollection' put: nil;
    at: #'SystemNavigation' put: nil;
    yourself