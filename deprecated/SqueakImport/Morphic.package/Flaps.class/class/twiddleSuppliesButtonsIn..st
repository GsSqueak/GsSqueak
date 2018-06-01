predefined flaps
twiddleSuppliesButtonsIn: aStrip
	"Munge item(s) in the strip whose names as seen in the parts bin should be different from the names to be given to resulting torn-off instances"

	(aStrip submorphs detect: [:m | m target == StickyPadMorph] ifNone: [nil])
		ifNotNil:
			[:aButton | aButton arguments: {#newStandAlone.  'tear off'}]