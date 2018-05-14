private
checkSymbol: aSymbol
  "aSymbol bindings are about to be changed.
	if there is anything to check up, do it here and return the actual
	symbol to be used"

  aSymbol isSymbol
    ifFalse: [ self lispError: 'symbol expected, got ' , aSymbol asString ].
  (constantVariables pointsTo: aSymbol)
    ifTrue: [ self lispError: aSymbol , ' is a constant, can''t be bound' ].
  ^ aSymbol