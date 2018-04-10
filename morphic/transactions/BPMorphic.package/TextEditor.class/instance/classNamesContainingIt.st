menu messages
classNamesContainingIt
	"Open a browser on classes whose names contain the selected string"
	self
		lineSelectAndEmptyCheck: [^ self].
	self systemNavigation browseClassesWithNamesContaining: self selection string caseSensitive: Sensor leftShiftDown