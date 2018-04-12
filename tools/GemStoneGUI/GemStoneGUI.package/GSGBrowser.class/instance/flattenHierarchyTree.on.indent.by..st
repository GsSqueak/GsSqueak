class list
flattenHierarchyTree: classHierarchy on: col indent: indent by: indentChars
	"Recursively add to col the names in classHierarchy indenting to show the hierarchical relationship. Use indentChars to do the indenting: spaces, tabs, etc."
	| plusIndent |
	plusIndent := indentChars.
	classHierarchy do: [:assoc |
		| class childs |
		class := assoc key.
		col add: indent , class name.
		childs := assoc value.
		self
			flattenHierarchyTree: childs
			on: col
			indent: indent , plusIndent
			by: indentChars].
	^ col