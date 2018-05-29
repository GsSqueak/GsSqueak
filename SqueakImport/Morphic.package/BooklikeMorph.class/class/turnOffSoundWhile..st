as yet unclassified
turnOffSoundWhile: aBlock
	"Turn off page flip sound during the given block."
	| old |
	old := PageFlipSoundOn.
	PageFlipSoundOn := false.
	aBlock value.
	PageFlipSoundOn := old