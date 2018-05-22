instance creation
addDarkMenusAndDockingBars: theme
	"self createDark apply."
	theme
		set: #borderWidth for: #MenuMorph to: 1;
		set: #borderColor for: #MenuMorph to: self darkBackgroundHighlights;
		set: #color for: #MenuMorph to: self darkBackground;
		set: #titleTextColor for: #MenuMorph to: self darkContentEmphasizedMore;
		set: #lineColor for: #MenuMorph to: self darkBackgroundHighlights;
		set: #lineStyle for: #MenuMorph to: BorderStyle default;
		set: #lineWidth for: #MenuMorph to: 1.
		
	theme
		set: #textColor for: #MenuItemMorph to: self darkContentEmphasized;
		set: #disabledTextColor for: #MenuItemMorph to: self darkContentSecondary;
		set: #selectionColor for: #MenuItemMorph to: self darkSelectionColor;
		set: #selectionTextColor for: #MenuItemMorph to: self darkSelectionTextColor.
		"set: #subMenuMarker for: #MenuItemMorph to: nil." "Use hard-coded default. See MenuItemMorph."
		
	"The world main docking bar."
	theme
		set: #color for: #DockingBarMorph to: self darkBackgroundHighlights;
		set: #selectionColor for: #DockingBarItemMorph to: self darkContentSecondary;
		set: #logoColor for: #TheWorldMainDockingBar to: self darkContentEmphasized;
		set: #selectionLogoColor for: #TheWorldMainDockingBar to: self darkContentEmphasizedMore.