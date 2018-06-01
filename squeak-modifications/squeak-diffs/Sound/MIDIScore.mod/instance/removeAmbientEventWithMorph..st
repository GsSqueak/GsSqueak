ambient track
removeAmbientEventWithMorph: aMorph
	| i |
	i := ambientTrack findFirst: [:e | e morph == aMorph].
	i = 0 ifTrue: [^ self].
	ambientTrack := ambientTrack copyReplaceFrom: i to: i with: Array new