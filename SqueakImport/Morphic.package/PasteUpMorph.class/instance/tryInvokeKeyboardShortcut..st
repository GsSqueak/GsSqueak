events-processing
tryInvokeKeyboardShortcut: aKeyboardEvent

	aKeyboardEvent commandKeyPressed ifFalse: [^ self].
	
	aKeyboardEvent keyCharacter caseOf: {
		[$R] -> [Utilities browseRecentSubmissions].
		[$L] -> [self findAFileList: aKeyboardEvent].
		[$O] -> [self findAMonticelloBrowser].
		[$P] -> [self findAPreferencesPanel: aKeyboardEvent].
		"[$Z] -> [ChangeList browseRecentLog]."
		[$]] -> [Smalltalk snapshot: true andQuit: false].
		[$+] -> [Preferences increaseFontSize].
		[$-] -> [Preferences decreaseFontSize].
		[$=] -> [Preferences restoreDefaultFonts].
	} otherwise: [^ self "no hit"].
	
	aKeyboardEvent ignore "hit!".