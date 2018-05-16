instance creation
addLightButtons: theme
	"self createLight apply."
	theme
		set: #borderColor for: #PluggableButtonMorph to: self lightContentSecondary;
		set: #color for: #PluggableButtonMorph to: self lightBackgroundHighlights;
		set: #textColor for: #PluggableButtonMorph to: self lightContentEmphasizedMore;

		set: #selectionModifier for: #PluggableButtonMorph to: [ [:c | c adjustBrightness: -0.1] ];
		set: #hoverModifier for: #PluggableButtonMorph to: [ [:c | c adjustBrightness: -0.1] ];
		set: #feedbackModifier for: #PluggableButtonMorph to: [ [:c | c adjustBrightness: -0.3] ].
	
	"And the plus-version."
	theme set: #disabledTextColor for: #PluggableButtonMorphPlus to: self lightContentSecondary.
