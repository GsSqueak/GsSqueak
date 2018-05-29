initialization
makeButton: aString balloonText: anotherString for: aSymbol 
	^ SimpleButtonDelayedMenuMorph new target: self;
		 borderColor: #raised;
		 color: self colorForButtons;
		 label: aString translated font: self fontForButtons;
		 setBalloonText: anotherString translated;
		 actionSelector: aSymbol