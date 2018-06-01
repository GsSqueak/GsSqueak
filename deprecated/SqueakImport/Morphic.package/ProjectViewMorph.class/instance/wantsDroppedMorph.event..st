dropping/grabbing
wantsDroppedMorph: aMorph event: evt
	"Answer if the receiver would accept a drop of a given morph."

	"If drop-enabled not set, answer false"
	(super wantsDroppedMorph: aMorph event: evt) ifFalse: [^ false].

	"If project not present, not morphic, or not initialized, answer false"
	self isTheRealProjectPresent ifFalse: [^ false].
	project isMorphic ifFalse: [^ false].
	project world viewBox ifNil: [^ false].

	^ true