initialize-release
arguments: argNodes statements: statementsCollection returns: returnBool from: encoder 
	"Compile."
	arguments := argNodes.
	statements := statementsCollection size > 0
				ifTrue: [statementsCollection]
				ifFalse: [Array with: NodeNil].
	optimized := false.
	returns := returnBool