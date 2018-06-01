installing
installButton

	| aButton aLabel |
	aButton := UpdatingThreePhaseButtonMorph checkBox
		target: self model;
		actionSelector: self actionSelector;
		getSelector: self valueSelector;
		yourself.
	aLabel := (StringMorph contents: self label translated
				font: (StrikeFont familyName: TextStyle defaultFont familyName
							pointSize: TextStyle defaultFont pointSize - 1)).
	self addMorph: (self horizontalPanel
		addMorphBack: aButton;
		addMorphBack: aLabel;
		yourself).