ambient track
addAmbientEvent: evt
	| i |
	i := ambientTrack findFirst: [:e | e time >= evt time].
	i = 0 ifTrue: [^ ambientTrack := ambientTrack , (Array with: evt)].
	ambientTrack := ambientTrack copyReplaceFrom: i to: i-1 with: (Array with: evt)