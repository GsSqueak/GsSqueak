private
enclosingNodeFor: enumerator of: rootNode 
	"Answer the minimum enclosing root node for aVariabe or nil if none.
	If the variable is accessed in more than one subnode then the
	rootNode is the
	enclosing node, otherwise it is which ever single subnode node that
	includes it, if any.
	enumerator applies its argument to all relevant subnodes of rootNode."
	| enclosingNodeOrNil |
	enclosingNodeOrNil := nil.
	enumerator
		value: [:subnode | (subnode accept: self)
				ifNotNil: [:enclosingNode | enclosingNodeOrNil := enclosingNodeOrNil
								ifNil: [enclosingNode]
								ifNotNil: [rootNode]]].
	^ enclosingNodeOrNil