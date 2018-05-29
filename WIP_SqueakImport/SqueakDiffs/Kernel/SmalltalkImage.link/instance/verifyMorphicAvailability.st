miscellaneous
verifyMorphicAvailability
	"If Morphic is available, return true; if not, put up an informer and return false"
	self hasMorphic ifFalse:
		[Beeper beep.
		self inform: 'Sorry, Morphic must
be present to use this feature'.
		^ false].
	^ true
