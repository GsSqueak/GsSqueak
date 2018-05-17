instance creation
addButtons: theme

	theme
		set: #borderColor for: #PluggableButtonMorph to: Color gray;
		set: #borderWidth for: #PluggableButtonMorph to: 1;
		set: #borderStyle for: #PluggableButtonMorph to: BorderStyle default;
		set: #color for: #PluggableButtonMorph to: (Color gray: 0.91);
		
		set: #font for: #PluggableButtonMorph to: [Preferences standardButtonFont];
		set: #textColor for: #PluggableButtonMorph to: Color black;

		set: #selectionModifier for: #PluggableButtonMorph to: [ [:c | c adjustBrightness: -0.2] ];
		set: #hoverModifier for: #PluggableButtonMorph to: [ [:c | c adjustBrightness: -0.1] ];
		set: #feedbackModifier for: #PluggableButtonMorph to: [ [:c | c adjustBrightness: -0.3] ].
	
	"And the plus-version."
	theme
		set: #disabledColor for: #PluggableButtonMorphPlus to: Color transparent;
		set: #disabledTextColor for: #PluggableButtonMorphPlus to: (Color gray: 0.6).

	"And the three-phase button."
	theme
		derive: #color for: #ThreePhaseButtonMorph from: #PluggableButtonMorph at: #textColor;
		derive: #font for: #ThreePhaseButtonMorph from: #PluggableButtonMorph;
		derive: #textColor for: #ThreePhaseButtonMorph from: #PluggableButtonMorph.