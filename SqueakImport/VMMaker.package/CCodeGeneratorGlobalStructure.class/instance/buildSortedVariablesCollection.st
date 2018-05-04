C code generator
buildSortedVariablesCollection
	"Build sorted vars, end result will be sorted collection based on static usage, 
	perhaps cache lines will like this!"

	| globalNames sorted |

	globalNames := Bag new: globalVariableUsage size.
	globalVariableUsage keysAndValuesDo: [:k :v | 
		(variableDeclarations includesKey: k) ifFalse: 
			[globalNames add: k withOccurrences: v size]].	
	variableDeclarations keysDo: 
		[:e | globalNames add: e withOccurrences: 0].
	sorted := SortedCollection sortBlock: 
		[:a :b | (globalNames occurrencesOf: a) > (globalNames occurrencesOf: b)].
	sorted addAll: variables.
	^sorted