submenu - tools
transcriptMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Transcript' translated;
			help: 'Open the Transcript' translated;
			icon: (self colorIcon: Transcript windowColorToUse);
			target: Transcript;
			selector: #open ]