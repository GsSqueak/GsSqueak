instance creation
addDullerMenusAndDockingBars: theme

	theme
		set: #borderColor for: #MenuMorph to: Color gray duller;
		set: #color for: #MenuMorph to: (Color gray: 0.9) duller;	
		set: #lineColor for: #MenuMorph to: (Color gray: 0.9) duller.
		
	theme
		set: #disabledTextColor for: #MenuItemMorph to: Color gray duller;
		set: #selectionColor for: #MenuItemMorph to: (Color r: 0.4 g: 0.5 b: 0.7) duller.