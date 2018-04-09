*SqCollectionLiterals-private
condenseNewSymbols
	"Move all symbols from NewSymbols to SymbolTable, and compact SymbolTable."

	| originalNewSymbols originalSymbolTable newNewSymbols newSymbolTable |
	originalNewSymbols := NewSymbols.
	originalSymbolTable := SymbolTable.
	newNewSymbols := WeakSet new.
	newSymbolTable := originalSymbolTable copy
		addAll: originalNewSymbols;
		compact;
		yourself.
	originalNewSymbols == NewSymbols ifFalse: [
		"Some other process has modified the symbols. Try again."
		^self condenseNewSymbols ].
	NewSymbols := newNewSymbols.
	SymbolTable := newSymbolTable
