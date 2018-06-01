buttons
makeTheSimpleButtons

	^{
		self buttonNewProject.

		self buttonPrev.
		self buttonNext.
		self buttonPublish.
		self buttonFind.
		self buttonFullScreen.

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
