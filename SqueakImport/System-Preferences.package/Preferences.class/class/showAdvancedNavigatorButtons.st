standard queries
showAdvancedNavigatorButtons
	^ self
		valueOfFlag: #showAdvancedNavigatorButtons
		ifAbsent: [false]