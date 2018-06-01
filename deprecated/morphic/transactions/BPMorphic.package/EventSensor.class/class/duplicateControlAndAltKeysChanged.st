preference change notification
duplicateControlAndAltKeysChanged
	"The Preference for duplicateControlAndAltKeys has changed; reset the
	other two."
	(Preferences
			valueOfFlag: #swapControlAndAltKeys
			ifAbsent: [false])
		ifTrue: [self inform: 'Resetting swapControlAndAltKeys preference'.
			(Preferences preferenceAt: #swapControlAndAltKeys)
				rawValue: false].
	(Preferences
			valueOfFlag: #duplicateAllControlAndAltKeys
			ifAbsent: [false])
		ifTrue: [self inform: 'Resetting duplicateAllControlAndAltKeys preference'.
			(Preferences preferenceAt: #duplicateAllControlAndAltKeys)
				rawValue: false].
	self installKeyDecodeTable