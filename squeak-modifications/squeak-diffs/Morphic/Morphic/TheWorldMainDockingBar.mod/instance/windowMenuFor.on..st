submenu - windows
windowMenuFor: window on: menu
	menu 
		addItem: [ :item |
			item
				contents: 'Close' translated ;
				target: window;
				selector: #delete ];
		addItem: [ :item |
			item
				contents: 'Close all like this' translated ;
				target: self;
				selector: #closeAllWindowsLike:;
				arguments: { window } ];
		addItem: [ :item |
			item
				contents: 'Close all but this' translated ;
				target: self;
				selector: #closeAllWindowsBut:;
				arguments: { window } ];
		addItem: [ :item |
			item 
				contents: 'Expand or Contract' translated ;
				target: window;
				selector: #expandBoxHit ]