e-toy support
referencePlayfield
	"Answer a pasteup morph to be used as the reference for cartesian
	coordinates. Do not get fooled by other morphs (like viewers) that
	happen to be named 'playfield'."
	^ self isWorldMorph
		ifTrue: [self
				submorphThat: [:s | s knownName = 'playfield'
						and: [s isPlayfieldLike]]
				ifNone: [self]]
		ifFalse: [super referencePlayfield]