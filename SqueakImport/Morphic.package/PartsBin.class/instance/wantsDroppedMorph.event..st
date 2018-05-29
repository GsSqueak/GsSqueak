dropping/grabbing
wantsDroppedMorph: aMorph event: evt
	"Answer whether the receiver would like to accept the given morph.  For a Parts bin, we accept just about anything except something that just originated from ourselves"

	(aMorph hasProperty: #beFullyVisibleAfterDrop) ifTrue:
		[^ true].

	^ super wantsDroppedMorph: aMorph event: evt