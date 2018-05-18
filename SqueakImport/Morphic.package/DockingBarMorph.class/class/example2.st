samples
example2
	" 
	DockingBarMorph example2.  
	Project current world deleteDockingBars.  
	"
	| menu |
	menu := DockingBarMorph new.
	""
	menu addSpace: 10.
	menu
		add: 'Squeak'
		icon: MenuIcons smallConfigurationIcon
		subMenu: self squeakMenu.
	menu
		add: 'Configuration'
		icon: MenuIcons smallWindowIcon
		subMenu: self squeakMenu.
	menu addSpace: 10.
	menu addLine.
	menu addSpace: 10.
	menu
		addMorphBack: (ImageMorph new image: MenuIcons smallBackIcon).
	menu addSpace: 10.
	menu
		addMorphBack: (ImageMorph new image: MenuIcons smallForwardIcon).
	menu addSpace: 10.
	menu addLine.
	menu addSpacer.
	""
	menu addMorphBack: ProjectNavigationMorph new speakerIcon.
	""
	menu addSpace: 10.
	menu
		addMorphBack: (ClockMorph new show24hr: true).
	menu addSpace: 10.
	""
	menu adhereToTop.
	""
	menu autoGradient: true.
	""
	^ menu openInWorld