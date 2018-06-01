process primitive support
wakeHighestPriority
	"Return the highest priority process that is ready to run."
	"Note: It is a fatal VM error if there is no runnable process."
	| schedLists p processList |
	schedLists := objectMemory fetchPointer: ProcessListsIndex ofObject: self schedulerPointer.
	p := objectMemory fetchWordLengthOf: schedLists.
	p := p - 1.
	"index of last indexable field"
	processList := objectMemory fetchPointer: p ofObject: schedLists.
	[self isEmptyList: processList]
		whileTrue: [p := p - 1.
			p < 0 ifTrue: [self error: 'scheduler could not find a runnable process'].
			processList := objectMemory fetchPointer: p ofObject: schedLists].
	^ self removeFirstLinkOfList: processList