garbage collection
noteAsRoot: oop headerLoc: headerLoc 
	"Record that the given oop in the old object area points to an 
	object in the young area. 
	HeaderLoc is usually = oop, but may be an addr in a 
	forwarding block."
	| header |
	<inline: true>
	header := self longAt: headerLoc.
	(header bitAnd: self rootBit) = 0
		ifTrue: ["record oop as root only if not already recorded"
			rootTableCount < RootTableRedZone
				ifTrue: ["record root if there is enough room in the roots 
					table "
					rootTableCount := rootTableCount + 1.
					rootTable at: rootTableCount put: oop.
					self longAt: headerLoc put: (header bitOr: self rootBit)]
				ifFalse: ["we're getting in the red zone"
					rootTableCount < RootTableSize
						ifTrue: ["but there's still space to record it"
							rootTableCount := rootTableCount + 1.
							rootTable at: rootTableCount put: oop.
							self longAt: headerLoc put: (header bitOr: self rootBit).
							"but force an IGC on the next allocation"
							allocationCount := allocationsBetweenGCs + 1]]]