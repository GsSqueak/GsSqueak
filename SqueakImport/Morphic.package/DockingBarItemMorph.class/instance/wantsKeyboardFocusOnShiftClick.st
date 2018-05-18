events
wantsKeyboardFocusOnShiftClick
	"set this preference to false to prevent user editing of docking bar menu items"
	^Preferences valueOfPreference: #allowMenubarItemEditing ifAbsent: [true]