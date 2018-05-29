tabs
tabMorphs
	"Presently all the submorphs are ReferenceMorphs, but this still supports an earlier design where spacers are interleaved, and where the old TabMorph class was used"

	^ submorphs select: [:m | (m isKindOf: TabMorph) or: [m isKindOf: ReferenceMorph]]