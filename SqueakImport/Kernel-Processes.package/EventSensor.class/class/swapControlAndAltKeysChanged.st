preference change notification
swapControlAndAltKeysChanged
	"The Preference for swapControlAndAltKeys has changed; reset the other two."
	(Preferences
		valueOfFlag: #duplicateControlAndAltKeys
		ifAbsent: [false]) ifTrue: [
			self inform: 'Resetting duplicateControlAndAltKeys preference'.
			(Preferences preferenceAt: #duplicateControlAndAltKeys) rawValue: false.
		].
	(Preferences
		valueOfFlag: #duplicateAllControlAndAltKeys
		ifAbsent: [false]) ifTrue: [
			self inform: 'Resetting duplicateAllControlAndAltKeys preference'.
			(Preferences preferenceAt: #duplicateAllControlAndAltKeys) rawValue: false.
		].
	self installKeyDecodeTable.
