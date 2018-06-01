waiting
wait
	"Wait unconditionally for this promise to become fulfilled or rejected."
	| sema |
	sema := Semaphore new.
	self whenResolved:[sema signal].
	self whenRejected:[sema signal].
	sema wait.
	^ self isResolved
		ifTrue: [ value ]
		ifFalse: [ BrokenPromise new promise: self; signal ]