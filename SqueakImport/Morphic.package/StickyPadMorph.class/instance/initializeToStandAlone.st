parts bin
initializeToStandAlone
	"Initialize the receiver to stand alone.  Use the next color in the standard sequence."

	Colors ifNil: [self initialize].
	LastColorIndex := 
		LastColorIndex
			ifNil:
				[1]
			ifNotNil:
				[(LastColorIndex \\ Colors size) + 1].
	super initializeToStandAlone.
	self assureExternalName.
	self color: (Colors at: LastColorIndex).
	self extent: 100@80.
	self borderWidth: 0
	