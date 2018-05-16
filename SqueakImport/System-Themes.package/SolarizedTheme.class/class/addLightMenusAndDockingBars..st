instance creation
addLightMenusAndDockingBars: theme
	"self createLight apply."
	theme
		set: #borderWidth for: #MenuMorph to: 1;
		set: #borderColor for: #MenuMorph to: self lightBackgroundHighlights;
		set: #color for: #MenuMorph to: self lightBackground;
		set: #titleTextColor for: #MenuMorph to: self lightContentEmphasizedMore;
		set: #lineColor for: #MenuMorph to: self lightBackgroundHighlights;
		set: #lineStyle for: #MenuMorph to: BorderStyle default;
		set: #lineWidth for: #MenuMorph to: 1.
		
	theme
		set: #textColor for: #MenuItemMorph to: self lightContentEmphasized;
		set: #disabledTextColor for: #MenuItemMorph to: self lightContentSecondary;
		set: #selectionColor for: #MenuItemMorph to: self lightBackgroundHighlights;
		set: #selectionTextColor for: #MenuItemMorph to: self lightContentEmphasizedMore.
		"set: #subMenuMarker for: #MenuItemMorph to: nil." "Use hard-coded default. See MenuItemMorph."
		
	"The world main docking bar."
	theme
		set: #color for: #DockingBarMorph to: self lightBackgroundHighlights;
		set: #selectionColor for: #DockingBarItemMorph to: self lightContentSecondary;
		set: #logoColor for: #TheWorldMainDockingBar to: self lightContentEmphasized;
		set: #selectionLogoColor for: #TheWorldMainDockingBar to: self lightContentEmphasizedMore.