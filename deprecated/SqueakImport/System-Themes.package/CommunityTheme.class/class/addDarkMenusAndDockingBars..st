instance creation
addDarkMenusAndDockingBars: aUserInterfaceTheme
	"self createDark apply."
	aUserInterfaceTheme
		set: #borderWidth for: #MenuMorph to: 0;
		set: #color for: #MenuMorph to: Color darkGray twiceDarker;
		set: #titleTextColor for: #MenuMorph to: Color white;
		set: #lineColor for: #MenuMorph to: Color darkGray;
		set: #lineStyle for: #MenuMorph to: BorderStyle default;
		set: #lineWidth for: #MenuMorph to: 1.
	aUserInterfaceTheme
		set: #textColor for: #MenuItemMorph to: self dbForeground;
		set: #selectionColor for: #MenuItemMorph to: self dbSelection;
		set: #selectionTextColor for: #MenuItemMorph to: Color white ;
		set: #disabledTextColor for: #MenuItemMorph to: self dbForeground muchDarker.
		"set: #subMenuMarker for: #MenuItemMorph to: nil." "Use hard-coded default. See MenuItemMorph."
	"The world main docking bar."
	aUserInterfaceTheme
"		set: #color for: #DockingBarMorph to: Color darkGray;"
"		set: #selectionColor for: #DockingBarItemMorph to: self darkContentSecondary;"
		set: #logoColor for: #TheWorldMainDockingBar to: Color white;
		set: #selectionLogoColor for: #TheWorldMainDockingBar to: Color white