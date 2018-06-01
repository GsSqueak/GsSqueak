access
methodClassName
	| tokens |
	(class isNil
	and: [type = #doIt
	and: [([(tokens := Scanner new scanTokens: self text) size >= 3]
			on: Error do: [:ex| false])
	and: [(tokens includes: #'.') not "exclude multi-statement doits"
	and: [tokens first isSymbol
	and: [tokens first isKeyword not
	and: [tokens first first canBeGlobalVarInitial
	and: [(tokens includes: #instanceVariableNames:)
		or: [tokens second == #comment:
		or: [tokens third == #comment:]]]]]]]]]) ifTrue:
		["Could be a class definition.
			Class definitions start with Superclass blahSubclass: #ClassName
			Metaclass definitions start with ClassName class instanceVariableNames:"
		 (tokens second isSymbol
		  and: [tokens second isKeyword
		  and: [tokens third isSymbol
		  and: [tokens third isKeyword not
		  and: [(2 to: tokens size by: 2) allSatisfy: [:i| (tokens at: i) isKeyword]]]]]) ifTrue:
			[^tokens third].
		 (tokens size = 4
		  and: [tokens second = #class
		  and: [(tokens third = #instanceVariableNames: or: [tokens third = #comment:])
		  and: [tokens last isString]]]) ifTrue:
			[^tokens first].
		 (tokens size = 3
		  and: [tokens second = #comment:
		  and: [tokens last isString]]) ifTrue:
			[^tokens first]].
	^class