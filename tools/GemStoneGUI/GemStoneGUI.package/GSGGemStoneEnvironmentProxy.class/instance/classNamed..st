interface
classNamed: className

	^ self interface environment: self classNamed: className ifAbsent: [nil]