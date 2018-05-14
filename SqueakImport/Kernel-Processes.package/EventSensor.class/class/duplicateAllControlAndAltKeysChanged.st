preference change notification
duplicateAllControlAndAltKeysChanged
	"The Preference for duplicateAllControlAndAltKeys has changed; reset the other two."
	"At some point the various exclusive CtrlAlt-key prefs should become a radio button set, then these methods wouldn't be needed."
	(Preferences
		valueOfFlag: #swapControlAndAltKeys
		ifAbsent: [false]) ifTrue: [
			self inform: 'Resetting swapControlAndAltKeys preference'.
			(Preferences preferenceAt: #swapControlAndAltKeys) rawValue: false.
		].
	(Preferences
		valueOfFlag: #duplicateControlAndAltKeys
		ifAbsent: [false]) ifTrue: [
			self inform: 'Resetting duplicateControlAndAltKeys preference'.
			(Preferences preferenceAt: #duplicateControlAndAltKeys) rawValue: false.
		].
	self installKeyDecodeTable.
