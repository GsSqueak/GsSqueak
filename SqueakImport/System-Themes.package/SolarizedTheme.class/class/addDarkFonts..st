instance creation
addDarkFonts: theme

	"Set-up fonts."
	theme
		set: #balloonHelpFont to: (StrikeFont familyName: 'Darkmap DejaVu Sans' pointSize: 7);
		set: #standardButtonFont to: (StrikeFont familyName: 'Darkmap DejaVu Sans' pointSize: 7);
		set: #standardCodeFont to: (StrikeFont familyName: 'Darkmap DejaVu Sans' pointSize: 9);
		set: #standardFlapFont to: (StrikeFont familyName: 'Darkmap DejaVu Sans' pointSize: 7 emphasized: TextEmphasis bold emphasisCode);
		set: #haloLabelFont to: (StrikeFont familyName: 'Darkmap DejaVu Sans' pointSize: 9);
		set: #standardListFont to: (StrikeFont familyName: 'Darkmap DejaVu Sans' pointSize: 9);
		set: #standardMenuFont to: (StrikeFont familyName: 'Darkmap DejaVu Sans' pointSize: 9);
		set: #standardSystemFont to: (StrikeFont familyName: 'Darkmap DejaVu Sans' pointSize: 9);
		set: #windowTitleFont to: (StrikeFont familyName: 'Darkmap DejaVu Sans' pointSize: 9).