as yet unclassified
turnOffSoundWhile: aBlock 
	"Turn off page flip sound during the given block."
	| _gsSqueakTemp_old |
	_gsSqueakTemp_old := PageFlipSoundOn.
	PageFlipSoundOn := false.
	aBlock value.
	PageFlipSoundOn := _gsSqueakTemp_old