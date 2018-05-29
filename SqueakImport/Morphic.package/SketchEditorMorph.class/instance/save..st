start & finish
save: evt
	"Palette is telling us that the use wants to end the painting session.  "

	Cursor blank show.
	(self getActionFor: evt) == #polygon: ifTrue: [self polyFreeze].		"end polygon mode"
	^ self deliverPainting: #okay evt: evt.