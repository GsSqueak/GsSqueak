other
isInFullScreenMode
	^ self
		valueOfProperty: #fullScreenMode
		ifAbsent: [false]