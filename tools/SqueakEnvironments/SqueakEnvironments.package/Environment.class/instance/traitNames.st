classes and traits
traitNames
	^ self allTraits
		collect: [:ea | ea @env7: name]
