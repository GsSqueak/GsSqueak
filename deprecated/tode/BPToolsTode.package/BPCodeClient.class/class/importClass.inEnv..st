as yet unclassified
importClass: aSymbol inEnv: envId
  | classSpec |
  classSpec := self fetchClass: aSymbol.
  classSpec
    ifEmpty: [ 
      (GsNotifyInteraction prompt: aSymbol asString , ' not found in squeak!') signal.
      ^ false ].
  self loadClass: classSpec inEnv: envId