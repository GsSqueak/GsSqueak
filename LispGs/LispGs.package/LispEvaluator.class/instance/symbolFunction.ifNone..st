private
symbolFunction: aSymbol ifNone: aBlock
  ^ environment symbolValue: aSymbol ifNone: aBlock