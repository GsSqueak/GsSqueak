instance creation
addDarkMenusAndDockingBars: theme
	"self createDark apply."
	theme
		set: #borderWidth for: #MenuMorph to: 1;
		set: #borderColor for: #MenuMorph to: self invisibleColor;
		set: #color for: #MenuMorph to: self backgroundColor;
		set: #titleTextColor for: #MenuMorph to: self yellow;
		set: #lineColor for: #MenuMorph to: self invisibleColor;
		set: #lineStyle for: #MenuMorph to: BorderStyle default;
		set: #lineWidth for: #MenuMorph to: 1.
		
	theme
		set: #textColor for: #MenuItemMorph to: self foregroundColor;
		set: #disabledTextColor for: #MenuItemMorph to: self grayLight;
		set: #selectionColor for: #MenuItemMorph to: self invisibleColor;
		set: #selectionTextColor for: #MenuItemMorph to: self yellow.
		"set: #subMenuMarker for: #MenuItemMorph to: nil." "Use hard-coded default. See MenuItemMorph."
		
	"The world main docking bar."
	theme
		set: #color for: #DockingBarMorph to: self invisibleColor;
		set: #selectionColor for: #DockingBarItemMorph to: self grayLight;
		set: #logoColor for: #TheWorldMainDockingBar to: self foregroundColor;
		set: #selectionLogoColor for: #TheWorldMainDockingBar to: self yellow.