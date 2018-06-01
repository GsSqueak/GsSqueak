the buttons
buttonLanguage
	"Answer a button for finding/loading projects"
	^ SimpleButtonDelayedMenuMorph new target: self;
		 borderColor: #raised;
		 color: self colorForButtons;
		 label: Project current naturalLanguage font: self fontForButtons;
		 setBalloonText: 'Click here to choose your language.' translated;
		 actionSelector: #chooseLanguage