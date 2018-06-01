plugin support
removeGCRoot: varLoc
	"Remove the given variable location to the extra roots table"
	| root |
	<export: true>
	<var: #varLoc declareC: 'sqInt *varLoc'>
	<var: #root declareC: 'sqInt *root'>
	1 to: extraRootCount do:[:i|
		root := extraRoots at: i.
		root == varLoc ifTrue:["swap varLoc with last entry"
			extraRoots at: i put: (extraRoots at: extraRootCount).
			extraRootCount := extraRootCount-1.
			^true]].
	^false "not found"