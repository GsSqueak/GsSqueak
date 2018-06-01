submenu - help
helpMenuOn: aDockingBar

	aDockingBar addItem: [ :it |
		it	contents: 'Help' translated;
			addSubMenu: [ :menu | 
				menu addItem: [:item |
						item
							contents: 'Squeak Help' translated;
							help: 'Integrated Help System' translated;
							target: self;
							selector: #squeakHelp].
				
				menu addLine.
				
				menu addItem:[:item|
					item
						contents: 'Online Resources' translated;
						help: 'Online resources for Squeak' translated;
						target: self;
						icon: MenuIcons smallHelpIcon;
						selector: #squeakOnlineResources].
				menu addItem:[:item|
					item
						contents: 'Squeak Swiki' translated;
						help: 'A very simple way to access Squeak Swiki resources in the image' translated;
						target: self;
						selector: #swiki].
				menu addItem:[:item|
					item
						contents: 'Keyboard Shortcuts' translated;
						help: 'Keyboard bindings used in Squeak' translated;
						target: self;
						selector: #commandKeyHelp ].
				menu addItem:[:item|
					item
						contents: 'Font Size Summary' translated;
						help: 'Font size summary.' translated;
						target: self;
						selector: #fontSizeSummary ].
				menu addItem:[:item|
					item
						contents: 'Useful Expressions' translated;
						help: 'Useful expressions' translated;
						target: self;
						selector: #usefulExpressions ].
				menu addLine.
				menu addItem:[:item|
					item
						contents: 'Terse Guide to Squeak' translated;
						help: 'Concise information about language and environment' translated;
						target: self;
						selector: #terseGuideToSqueak].
				menu addItem:[:item|
					item
						contents: 'Extending the system' translated;
						help: 'Includes code snippets to evaluate for extending the system' translated;
						target: self;
						icon: MenuIcons smallHelpIcon;
						selector: #extendingTheSystem].
				menu addLine.
				
			menu addItem:[:item|
				item
					contents: 'Release Notes' translated;
					help: 'Changes in this release' translated ;
					target: self;
					selector: #releaseNotes].
			menu addItem:[:item|
				item
					contents: 'Working With Squeak' translated;
					help: 'Information for new users' ;
					target: self;
					selector: #workingWithSqueak].
			menu addItem:[:item|
				item
					contents: 'The Squeak User Interface' translated;
					help: 'Descriptions of some of the more-unusual UI elements in Squeak' ;
					target: self;
					selector: #squeakUserInterface].
			menu addItem:[:item|
				item
					contents: 'License Information' translated;
					help: String empty ;
					target: self;
					selector: #licenseInformation].				
				
		
			menu addLine.
			menu addItem: [:item |
				item
					contents: 'About Squeak' translated;
					help: 'SystemReporter status of the image and runtime environment' translated;
					target: self;
					selector: #aboutSqueak].
		]]