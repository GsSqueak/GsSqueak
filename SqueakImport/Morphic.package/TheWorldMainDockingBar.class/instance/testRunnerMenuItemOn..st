submenu - tools
testRunnerMenuItemOn: menu
	Smalltalk at: #TestRunner ifPresent:[:aClass|
		menu addItem: [ :item |
			item
				contents: 'Test Runner' translated;
				help: 'Open the Test Runner' translated;
				icon: (self colorIcon: aClass basicNew windowColorToUse);
				target: aClass;
				selector: #open ]
	].