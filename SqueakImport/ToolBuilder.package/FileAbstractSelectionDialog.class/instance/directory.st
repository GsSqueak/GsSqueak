directory tree
directory
	"If nobody has set a specific directory we need a plausible default"

	^ directory ifNil: [ directory := FileDirectory default]