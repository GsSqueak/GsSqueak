garbage collection
incrementalGC
	"Do a mark/sweep garbage collection of just the young object 
	area of object memory (i.e., objects above youngStart), using 
	the root table to identify objects containing pointers to 
	young objects from the old object area."
	| survivorCount startTime weDidGrow |
	<inline: false>
	<var: #startTime type: 'sqLong'>
	rootTableCount >= RootTableSize
		ifTrue: ["root table overflow; cannot do an incremental GC (this should be very rare)"
			statRootTableOverflows := statRootTableOverflows + 1.
			^ self fullGC].
	DoAssertionChecks
		ifTrue: [interpreter reverseDisplayFrom: 8 to: 15.
			self validateRoots; validate].

	interpreter preGCAction: false.
	"incremental GC and compaction"

	startTime := interpreter ioMicroSecondClock.
	weakRootCount := 0.
	statSweepCount := statMarkCount := statMkFwdCount := statCompMoveCount := 0.
	self markPhase.
	1 to: weakRootCount do:[:i| self finalizeReference: (weakRoots at: i)].
	survivorCount := self sweepPhase.
	self incrementalCompaction.
	statAllocationCount := allocationCount.
	allocationCount := 0.
	statIncrGCs := statIncrGCs + 1.
	statGCTime := interpreter ioMicroSecondClock.
	statIGCDeltaTime := statGCTime - startTime.
	statIncrGCMSecs := statIncrGCMSecs + statIGCDeltaTime.
	interpreter capturePendingFinalizationSignals.

	interpreter forceInterruptCheck. "Force an an interrupt check ASAP.We could choose to be clever here and only do this under certain time conditions. Keep it simple for now"
	
	statRootTableCount  := rootTableCount.
	statSurvivorCount := survivorCount.
	weDidGrow := false.
	(((survivorCount > tenuringThreshold)
			or: [rootTableCount >= RootTableRedZone])
			or: [forceTenureFlag == true])
		ifTrue: ["move up the young space boundary if 
			* there are too many survivors: 
			this limits the number of objects that must be 
			processed on future incremental GC's 
			* we're about to overflow the roots table 
			this limits the number of full GCs that may be caused 
			by root table overflows in the near future"
			forceTenureFlag := false.
			statTenures := statTenures + 1.
			self clearRootsTable.
			(freeBlock < growHeadroom and: 
				[gcBiasToGrow > 0]) 
				ifTrue: [self biasToGrow.
						weDidGrow := true].
			youngStart := freeBlock].
	interpreter postGCAction.
	DoAssertionChecks
		ifTrue: [self validateRoots; validate.
			interpreter reverseDisplayFrom: 8 to: 15].
	weDidGrow ifTrue: [self biasToGrowCheckGCLimit]