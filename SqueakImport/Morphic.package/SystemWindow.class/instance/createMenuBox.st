initialization
createMenuBox
	^ (self createBox: self class menuBoxImage)
		actionSelector: #offerWindowMenu;
		setBalloonText: 'window menu' translated