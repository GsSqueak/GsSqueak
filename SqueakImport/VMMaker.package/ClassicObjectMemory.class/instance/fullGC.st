garbage collection
fullGC
	"Do a mark/sweep garbage collection of the entire object memory. Free inaccessible objects but do not move them."

	| startTime |
	<inline: false>
	<var: #startTime type: 'sqLong'>
	DoAssertionChecks ifTrue: [interpreter reverseDisplayFrom: 0 to: 7].
	interpreter preGCAction: true.
	startTime := interpreter ioMicroSecondClock.
	statSweepCount := statMarkCount := statMkFwdCount := statCompMoveCount := 0.
	self clearRootsTable.
	youngStart := self startOfMemory.  "process all of memory"
	self markPhase.
	"Sweep phase returns the number of survivors.
	Use the up-to-date version instead the one from startup."
	totalObjectCount := self sweepPhase.
	self fullCompaction.
	allocationCount := 0.
	statFullGCs := statFullGCs + 1.
	statGCTime := interpreter ioMicroSecondClock.
	statFullGCMSecs := statFullGCMSecs + (statGCTime - startTime).
	interpreter capturePendingFinalizationSignals.

	youngStart := freeBlock.  "reset the young object boundary"
	interpreter postGCAction.
	DoAssertionChecks ifTrue: [interpreter reverseDisplayFrom: 0 to: 7].
