configuration
classesToLoad

	^ self configuration at: 'classesToLoad' ifAbsent: [#()]