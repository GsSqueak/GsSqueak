*GemStoneGUI-Squeak
hierarchyTreeOfClassNames: arrayOfSymbols environmentId: envId

	| transformed classes |
	classes := arrayOfSymbols collect: [:className | self classNamed: className].
	transformed := classes collect: [:ea | 
		| childs indexes |
		childs := classes select: [:class | class isTrait not and: [class superclass = ea]].
		indexes := childs collect: [:child | classes indexOf: child].
		ea -> indexes].
	transformed copy do: [:ea |
		ea value: (ea value collect: [:idx | 
			| val |
			val := transformed at: idx.
			transformed at: idx put: nil.
			val])].
	^ transformed select: [:ea | ea notNil].