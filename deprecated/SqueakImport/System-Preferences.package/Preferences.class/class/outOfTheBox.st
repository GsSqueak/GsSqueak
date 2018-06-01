themes
outOfTheBox
	"The default out-of-the-box preference settings for Squeak 3.2.  The 'alternative' window-look and scrollbar-look are used.  Button panes are used but not annotation panes.  Scrollbars are on the right and do not flop out."

	self setPreferencesFrom: self defaultValueTableForCurrentRelease.
	SystemNavigation thoroughSenders: true.
	SystemWindow clickOnLabelToEdit: true.
	Text ignoreStyleIfOnlyBold: true.
	MenuMorph roundedMenuCorners: true.
	ScrollBar scrollBarsWithoutMenuButton: true.
	SoundPlayer soundQuickStart: false.
	SoundPlayer stopSoundWhenDone: false.
	SoundService soundEnabled: true.
	SoundRecorder canRecordWhilePlaying:false.