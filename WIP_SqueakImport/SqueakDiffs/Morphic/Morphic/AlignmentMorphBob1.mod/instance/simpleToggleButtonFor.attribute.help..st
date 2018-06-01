as yet unclassified
simpleToggleButtonFor: target attribute: attribute help: helpText

	^(Smalltalk at: #EtoyUpdatingThreePhaseButtonMorph ifAbsent:[^Morph new])
		checkBox
		target: target;
		actionSelector: #toggleChoice:;
		arguments: {attribute};
		getSelector: #getChoice:;
		setBalloonText: helpText;
		step

