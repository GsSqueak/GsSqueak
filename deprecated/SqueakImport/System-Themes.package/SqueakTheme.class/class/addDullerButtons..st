instance creation
addDullerButtons: theme

	theme
		set: #borderColor for: #PluggableButtonMorph to: Color gray duller;
		set: #color for: #PluggableButtonMorph to: (Color gray: 0.91) duller.
			
	"And the plus-version."
	theme
		set: #disabledTextColor for: #PluggableButtonMorphPlus to: (Color gray: 0.6) duller.