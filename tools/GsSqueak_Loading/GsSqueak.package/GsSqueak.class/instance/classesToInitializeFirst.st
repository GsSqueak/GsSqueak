configuration
classesToInitializeFirst

	^ self configuration at: 'classesToInitializeFirst' ifAbsent: [#()]