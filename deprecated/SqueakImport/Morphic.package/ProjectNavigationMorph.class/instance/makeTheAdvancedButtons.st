buttons
makeTheAdvancedButtons

	^{
		self buttonNewProject.
		self buttonShare.
		self buttonPrev.
		self buttonNext.
		self buttonPublish.
		self buttonNewer.
		self buttonTell.
		self buttonFind.
		self buttonFullScreen.
		"self buttonFlaps."
		self buttonPaint.
	},
	(
		Preferences includeSoundControlInNavigator ifTrue: [{self buttonSound}] ifFalse: [#()]
	),
	{
		self buttonLanguage.
		self buttonUndo.
		self buttonQuit.
	}
