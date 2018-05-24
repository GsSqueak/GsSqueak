query construction
condenseQuery: query

	| method |
	method := (Compiler new compile: query in: Object notifying: nil ifFail: []) generate.
	^ method decompile decompileString