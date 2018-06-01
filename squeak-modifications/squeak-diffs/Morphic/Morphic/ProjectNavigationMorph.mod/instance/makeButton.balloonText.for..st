as yet unclassified
makeButton: aString balloonText: anotherString for: aSymbol

	^ SimpleButtonDelayedMenuMorph new target: self;
		 borderColor: #raised;
		 color: self colorForButtons;
		 label: aString font: self fontForButtons;
		 setBalloonText: anotherString;
		 actionSelector: aSymbol