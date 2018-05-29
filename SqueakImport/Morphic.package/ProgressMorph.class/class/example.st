example
example
	"ProgressMorph example"

	| progress |
	progress := ProgressMorph label: 'Test progress'.
	progress subLabel: 'this is the subheading'.
	progress openInWorld.
	[10 timesRepeat:
		[(Delay forMilliseconds: 200) wait.
		progress incrDone: 0.1].
	progress delete] fork