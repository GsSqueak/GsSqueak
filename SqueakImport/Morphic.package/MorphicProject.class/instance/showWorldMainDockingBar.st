docking bars support
showWorldMainDockingBar

	^ self projectPreferenceFlagDictionary
		at: #showWorldMainDockingBar
		ifAbsent: [ false ]