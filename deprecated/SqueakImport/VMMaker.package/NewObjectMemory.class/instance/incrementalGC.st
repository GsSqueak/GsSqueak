garbage collection
incrementalGC
	"Do a mark/sweep garbage collection of just the young object
	area of object memory (i.e., objects above youngStart), using
	the root table to identify objects containing pointers to
	young objects from the old object area."
	| survivorCount weDidGrow |
	<inline: false>

	rootTableCount >= RootTableSize ifTrue:
		["root table overflow; cannot do an incremental GC (this should be very rare)"
		 statRootTableOverflows := statRootTableOverflows + 1.
		 ^self fullGC].

	self initializeFreeBlocksPreSweep.
	self runLeakCheckerForFullGC: false.

	interpreter preGCAction: false.
	"incremental GC and compaction"

	gcStartUsecs := self ioMicroSecondClock.
	weakRootCount := 0.
	statSweepCount := statMarkCount := statMkFwdCount := statCompMoveCount := 0.
	self markPhase: false.
	self assert: weakRootCount <= WeakRootTableSize.
	1 to: weakRootCount do:
		[:i| self finalizeReference: (weakRoots at: i)].
	survivorCount := self sweepPhase.
	self runLeakCheckerForFullGC: false.
	self incrementalCompaction.
	statIncrGCs := statIncrGCs + 1.
	statGCEndUsecs := self ioMicroSecondClock.
	statIGCDeltaUsecs := statGCEndUsecs - gcStartUsecs.
	statIncrGCUsecs := statIncrGCUsecs + statIGCDeltaUsecs.
	self capturePendingFinalizationSignals.
	
	statRootTableCount  := rootTableCount.
	statSurvivorCount := survivorCount.
	weDidGrow := false.
	(((survivorCount > tenuringThreshold)
	 or: [rootTableCount >= RootTableRedZone])
	 or: [forceTenureFlag == true]) ifTrue:
		["move up the young space boundary if
		  * there are too many survivors:
			this limits the number of objects that must be
			processed on future incremental GC's
		  * we're about to overflow the roots table:
			this limits the number of full GCs that may be caused
			by root table overflows in the near future"
		forceTenureFlag := false.
		statTenures := statTenures + 1.
		self clearRootsTable.
		((self freeSize < growHeadroom)
		 and: [gcBiasToGrow > 0]) ifTrue:
			[self biasToGrow.
			 weDidGrow := true].
		youngStart := freeStart].
	self postGCAction: false.
	
	self runLeakCheckerForFullGC: false.
	weDidGrow ifTrue:
		[self biasToGrowCheckGCLimit]