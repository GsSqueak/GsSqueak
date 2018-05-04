process primitive support
wakeHighestPriority
	"Return the highest priority process that is ready to run.
	 To save time looking at many empty lists before finding a
	 runnable process the VM maintains a variable holding the
	 highest priority runnable process.  If this variable is 0 then the
	 VM does not know the highest priority and must search all lists.
	 Note: It is a fatal VM error if there is no runnable process."
	| schedLists p processList |
	schedLists := objectMemory fetchPointer: ProcessListsIndex ofObject: self schedulerPointer.
	highestRunnableProcessPriority = 0
			ifTrue: [p := objectMemory fetchWordLengthOf: schedLists]
			ifFalse: [p := highestRunnableProcessPriority].
	p := p - 1.
	"index of last indexable field"
	[processList := objectMemory fetchPointer: p ofObject: schedLists.
	 self isEmptyList: processList] whileTrue:
		[(p := p - 1) < 0 ifTrue:
			[self error: 'scheduler could not find a runnable process']].
	highestRunnableProcessPriority := p + 1.
	^self removeFirstLinkOfList: processList