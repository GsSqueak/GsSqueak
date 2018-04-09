*SqCollectionLiterals-private
rehash
	"Rebuild the hash table, reclaiming unreferenced Symbols. This method will intern all symbols. You're probably looking for #condenseNewSymbols instead."

	| originalNewSymbols originalSymbolTable newNewSymbols newSymbolTable |
	originalNewSymbols := NewSymbols.
	originalSymbolTable := SymbolTable.
	newNewSymbols := WeakSet new.
	newSymbolTable := WeakSet withAll: self allSubInstances.
	originalNewSymbols == NewSymbols ifFalse: [
		"Some other process has modified the symbols. Try again."
		^self rehash ].
	NewSymbols := newNewSymbols.
	SymbolTable := newSymbolTable
