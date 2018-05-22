standard queries
haloTheme
	^ self
		valueOfFlag: #haloTheme
		ifAbsent: [#iconicHaloSpecifications]