events
mouseEnterDragging: evt 
	"unlock children for drop operations"
	self flag: #performance.
	"mt: There may be no need to change appearance if no widget wants
	the drop."
	self isActive
		ifTrue: [self lookFocused].
	(self isActive not
			and: [evt hand hasSubmorphs])
		ifTrue: [self activate.
			"unlock contents for drop"
			evt hand addMouseListener: self]