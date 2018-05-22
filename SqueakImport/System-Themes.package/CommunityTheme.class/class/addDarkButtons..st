instance creation
addDarkButtons: aUserInterfaceTheme
	"self createDark apply."
	aUserInterfaceTheme
		set: #borderColor for: #PluggableButtonMorph to: Color darkGray darker ;
		set: #color for: #PluggableButtonMorph to: Color gray darker ;
		set: #textColor for: #PluggableButtonMorph to: Color white;

		set: #selectionModifier for: #PluggableButtonMorph to: [ [:c | self dbSelection twiceDarker] ];
		set: #hoverModifier for: #PluggableButtonMorph to: [ [:c | c adjustBrightness: 0.2] ];
		set: #feedbackModifier for: #PluggableButtonMorph to: [ [:c | c adjustBrightness: 0.3] ].
	"And the plus-version."
	aUserInterfaceTheme set: #disabledTextColor for: #PluggableButtonMorphPlus to: Color lightGray