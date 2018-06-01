configuration
classesNotToInitialize

	^ self configuration at: 'classesNotToInitialize' ifAbsent: [#()]