utilities
isPseudoSelector: aSelector
	"Answer whether the given selector is a special marker"

	^ #(Comment Definition Hierarchy) includes: aSelector