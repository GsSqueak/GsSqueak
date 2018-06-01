configuration
classesNotToLoad

	^ self configuration at: 'classesNotToLoad' ifAbsent: [#()]