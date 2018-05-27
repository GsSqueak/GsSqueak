interface
hierarchyTreeOfClassNames: collectionOfSymbols

	| query |
	query := '[:symbols :symbolList :envId |
	| transformed classes |
	classes := Dictionary new.
	symbols do: [:symbol | | class |
		class := symbolList objectNamed: symbol.
		class ifNil: [self error: ''Unknown class''].
		classes at: symbol put: class].
	transformed := symbols collect: [:symbolA | 
		| childs indexes |
		childs := symbols select: [:symbolB |
			| classA classB |
			classA := classes at: symbolA.
			classB := classes at: symbolB.
			(classB superclassForEnv: envId) = classA].
		indexes := childs collect: [:child | symbols indexOf: child].
		symbolA -> indexes].
	transformed copy do: [:ea |
		ea value: (ea value collect: [:idx | 
			| val |
			val := transformed at: idx.
			transformed at: idx put: nil.
			val])].
	transformed select: [:ea | ea notNil]] value: {1} value: {2} value: {3}'
			format: {
				collectionOfSymbols storeString.
				self codeReferencingSymbolList.
				self environmentId}.
	^ self repository fetchHierarchyTree: query withElementsOfType: #Symbol