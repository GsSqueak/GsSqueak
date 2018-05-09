private - initialization
installPrimitiveAliases: bindings 
	| aliases topEnvironment |
	aliases := bindings
				collect: [:b | b copy].
	topEnvironment := initialEnvironment
				ifNil: [environment].
	"clean up previous definitions"
	topEnvironment allBoundSymbols
		do: [:f | | p | ((p := topEnvironment symbolValue: f) isLispPrimitive
					and: [(self class primitives pointsTo: p selector) not])
				ifTrue: [topEnvironment removeSymbolValue: f]].
	"create new definitions"
	aliases
		do: [:alias | ((topEnvironment bindsSymbol: alias key) not
					or: [(topEnvironment symbolValue: alias key) isSymbol])
				ifTrue: [topEnvironment addSymbolValue: alias.
					topEnvironment addSymbolValue: alias value selector -> alias value]]
