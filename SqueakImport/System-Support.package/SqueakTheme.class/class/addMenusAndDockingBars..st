instance creation
addMenusAndDockingBars: theme

	theme
		set: #borderColor for: #MenuMorph to: Color gray;
		set: #borderWidth for: #MenuMorph to: 1;
		set: #borderStyle for: #MenuMorph to: BorderStyle default;
		set: #color for: #MenuMorph to: (Color gray: 0.9);

		set: #titleBorderColor for: #MenuMorph to: (Color r: 0.6 g: 0.7 b: 1);
		set: #titleBorderWidth for: #MenuMorph to: 0;
		set: #titleBorderStyle for: #MenuMorph to: BorderStyle default;
		set: #titleColor for: #MenuMorph to: Color transparent;
		set: #titleFont for: #MenuMorph to: [Preferences windowTitleFont];
		set: #titleTextColor for: #MenuMorph to: Color black;
		
		set: #lineColor for: #MenuMorph to: (Color gray: 0.9);
		set: #lineStyle for: #MenuMorph to: BorderStyle inset;
		set: #lineWidth for: #MenuMorph to: 2.
		
	theme
		set: #font for: #MenuItemMorph to: [Preferences standardMenuFont];
		set: #textColor for: #MenuItemMorph to: Color black;
		set: #disabledTextColor for: #MenuItemMorph to: Color gray;
		set: #selectionColor for: #MenuItemMorph to: (Color r: 0.4 g: 0.5 b: 0.7);
		set: #selectionTextColor for: #MenuItemMorph to: Color white.
		
	"Derive some stuff for the docking bar morph, which looks mostly like a menu morph."
	theme
		set: #borderWidth for: #DockingBarMorph to: 0;
		derive: #borderColor for: #DockingBarMorph from: #MenuMorph;
		derive: #borderStyle for: #DockingBarMorph from: #MenuMorph;
		derive: #color for: #DockingBarMorph from: #MenuMorph;
	
		derive: #lineColor for: #DockingBarMorph from: #MenuMorph;
		derive: #lineStyle for: #DockingBarMorph from: #MenuMorph;
		derive: #lineWidth for: #DockingBarMorph from: #MenuMorph.
		
	"The world main docking bar."
	theme
		derive: #font for: #TheWorldMainDockingBar from: #MenuItemMorph;
		derive: #textColor for: #TheWorldMainDockingBar from: #MenuItemMorph;
		set: #logoColor for: #TheWorldMainDockingBar to: Color black;
		set: #selectionLogoColor for: #TheWorldMainDockingBar to: Color white.