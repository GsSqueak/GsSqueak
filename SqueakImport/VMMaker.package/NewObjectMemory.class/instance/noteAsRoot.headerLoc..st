garbage collection
noteAsRoot: oop headerLoc: headerLoc 
	"Record that the given oop in the old object area points to an 
	 object in the young area. HeaderLoc is usually = oop, but may
	 be an addr in a forwarding block."
	| header |
	<inline: true>
	<asmLabel: false> 
	header := self longAt: headerLoc.
	(header bitAnd: self rootBit) = 0 ifTrue:
		"record oop as root only if not already recorded"
		[rootTableCount < RootTableSize ifTrue:
			"record root if there is enough room in the roots  table "
			[rootTableCount := rootTableCount + 1.
			 rootTable at: rootTableCount put: oop.
			 self longAt: headerLoc put: (header bitOr: self rootBit).
			 rootTableCount > RootTableRedZone ifTrue:
				"if we're now in the red zone force an IGC ASAP"
				[self scheduleIncrementalGC]]]