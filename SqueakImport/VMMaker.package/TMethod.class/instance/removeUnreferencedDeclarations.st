inlining
removeUnreferencedDeclarations
	"Variables may have been eliminated during inlining. Remove declarations for those variables."
	declarations keys copy
		do: [:key | (args , locals includes: key)
				ifFalse: [declarations removeKey: key]]