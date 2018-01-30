events-processing
filterEvent: aKeyboardEvent for: anObject 
	"Provide keyboard shortcuts."
	"Delegate keyboard shortcuts to my docking bars."
	self
		submorphsDo: [:ea | ea isDockingBar
				ifTrue: [ea filterEvent: aKeyboardEvent for: anObject.
					"No support for converting events here!"
					aKeyboardEvent wasIgnored
						ifTrue: [^ aKeyboardEvent"no hit"]]].
	aKeyboardEvent isKeystroke
		ifFalse: [^ aKeyboardEvent"no hit"].
	aKeyboardEvent commandKeyPressed
		ifTrue: [aKeyboardEvent keyCharacter caseOf: {
				[$R] -> [Utilities browseRecentSubmissions].
				[$L] -> [self findAFileList: aKeyboardEvent].
				[$O] -> [self findAMonticelloBrowser].
				[$P] -> [self findAPreferencesPanel: aKeyboardEvent].
				["[$Z] -> [ChangeList browseRecentLog]."
				$]] -> [Smalltalk snapshot: true andQuit: false]}
				 otherwise: [^ aKeyboardEvent"no hit"].
			^ aKeyboardEvent ignore"hit!"].
	^ aKeyboardEvent"no hit"