language
updateLocaleDependents
	"Set the project's natural language as indicated"

	ActiveWorld allTileScriptingElements do: [:viewerOrScriptor |
			viewerOrScriptor localeChanged].

	Flaps disableGlobalFlaps: false.
	(Preferences eToyFriendly or: [
		(Smalltalk classNamed: 'SugarNavigatorBar') ifNotNil: [:c | c showSugarNavigator] ifNil: [false]])
		ifTrue: [
			Flaps addAndEnableEToyFlaps.
			ActiveWorld addGlobalFlaps]
		ifFalse: [Flaps enableGlobalFlaps].

	(Project current isFlapIDEnabled: 'Navigator' translated)
		ifFalse: [Flaps enableDisableGlobalFlapWithID: 'Navigator' translated].

	ScrapBook default emptyScrapBook.
	MenuIcons initializeTranslations.
	
	super updateLocaleDependents.

	"self setFlaps.
	self setPaletteFor: aLanguageSymbol."
