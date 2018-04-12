query construction
codeForHierarchicallySortingClassListCreatedBy: classListCreationCode environmentId: envId

	^ '[:col :envId |
		| transformed hierarchy flattenHierarchyTree |
		transformed := col collect: [:ea | 
			| childs indexes |
			childs := col select: [:class | (class superclassForEnv: envId) = ea].
			indexes := childs collect: [:child | col indexOf: child].
			ea -> indexes].
		transformed copy do: [:ea |
			ea value: (ea value collect: [:idx | 
				| val |
				val := transformed at: idx.
				transformed at: idx put: nil.
				val])].
		hierarchy := transformed select: [:ea | ea notNil].
		flattenHierarchyTree := [:classHierarchy :col :indent :indentChars |
			| plusIndent |
			plusIndent := indentChars.
			classHierarchy do: [:assoc |
				| class childs |
				class := assoc key.
				col add: indent , class name.
				childs := assoc value.
				flattenHierarchyTree
					value: childs
					value: col
					value: indent , plusIndent
					value: indentChars].
			col].
		flattenHierarchyTree 
			value: hierarchy
			value: OrderedCollection new
			value: ''''
			value: '' ''] value: (' , classListCreationCode , ') value: (' , envId , $)