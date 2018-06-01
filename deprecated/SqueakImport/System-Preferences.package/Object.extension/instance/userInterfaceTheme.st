*System-Preferences
userInterfaceTheme
	"Call this to conveniently access properties from the current user interface theme."

	^ UserInterfaceThemeRequest new
		target: self;
		theme: UserInterfaceTheme current;
		yourself