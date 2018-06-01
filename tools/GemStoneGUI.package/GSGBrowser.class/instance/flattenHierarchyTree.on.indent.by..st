class list
flattenHierarchyTree: hierarchy on: col indent: indent by: indentChars
	"Recursively add to col the elements in hierarchy indenting to show the hierarchical relationship. Use indentChars to do the indenting: spaces, tabs, etc."
	| plusIndent |
	plusIndent := indentChars.
	hierarchy do: [:assoc |
		| element childs |
		element := assoc key.
		col add: indent , element.
		childs := assoc value.
		self
			flattenHierarchyTree: childs
			on: col
			indent: indent , plusIndent
			by: indentChars].
	^ col