morphic gui
buttonWithAction: aSymbol label: labelString help: helpString

	^self newColumn
		wrapCentering: #center; cellPositioning: #topCenter;
		addMorph: (
			SimpleButtonMorph new 
				color: self borderAndButtonColor;
				target: self; 
				actionSelector: aSymbol;
				label: labelString;
				setBalloonText: helpString
		)
			