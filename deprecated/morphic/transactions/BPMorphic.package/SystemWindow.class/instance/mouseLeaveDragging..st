events
mouseLeaveDragging: evt 
	"Passivate after drop operations if needed. Unfortunately, we get a
	leave-dragging event for the system window we want to drag. Watch
	out for it."
	((model windowActiveOnFirstClick
				and: [(evt hand submorphs includes: self) not])
			or: [self isKeyWindow not])
		ifTrue: [self lookUnfocused].
	(self isKeyWindow not
			and: [evt hand hasSubmorphs])
		ifTrue: [self passivateIfNeeded.
			evt hand removeMouseListener: self]