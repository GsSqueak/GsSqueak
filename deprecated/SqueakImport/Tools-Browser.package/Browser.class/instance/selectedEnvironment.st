system category list
selectedEnvironment
	"Answer the browsed environment. If this returned a system category dependent
	value and possibly nil (as it did in previous versions), selectedClass would not work in
	a hierarchy browser that has to display classes from different environments
	(because the correct categories might be missing in the browser)"

	^ environment ifNil: [Smalltalk globals]