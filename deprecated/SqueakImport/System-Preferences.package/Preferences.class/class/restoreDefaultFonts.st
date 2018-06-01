prefs - fonts
restoreDefaultFonts
	"Since this is called from menus, we can take the opportunity to prompt for missing font styles."
	"
	Preferences restoreDefaultFonts
	"
	
	UserInterfaceTheme allThemes
		detect: [:ea | UserInterfaceTheme current name ~= ea name
			and: [UserInterfaceTheme current name includesSubstring: ea name]]
		ifFound: [:ea | 
			(Project uiManager
				confirm: ('Do you want to apply\"{1}"?' translated withCRs format: {ea name})
				title: 'Apply UI Theme' translated) ifTrue: [ea apply]]
		ifNone: [self inform: 'Sorry, could not revert font choices.\Please apply a UI theme with smaller fonts.' translated withCRs].