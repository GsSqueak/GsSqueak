instance creation
addDarkScrollables: theme
	"self createDark apply."

	"Scroll bars"
	theme
		set: #thumbColor for: #ScrollBar to: self darkBackground;
		set: #thumbBorderColor for: #ScrollBar to: self darkBackground;
		set: #thumbBorderWidth for: #ScrollBar to: 1;
		set: #thumbColorModifier for: #ScrollBar to: [ [:c | c adjustBrightness: -0.1] ];
		set: #pagingAreaColorModifier for: #ScrollBar to: [ [:c | Color transparent ] ];
		set: #borderColorModifier for: #ScrollBar to: [ [:c | c adjustBrightness: -0.1] ].
	
	"Scroll panes (includes generic stuff for list widgets, tree widgets, and text widgets."
	theme
		set: #borderWidth for: #ScrollPane to: 0;
	"	set: #borderColor for: #ScrollPane to: Color transparent;"
		set: #color for: #ScrollPane to: self darkBackground.
		
	"List widgets"
	theme
		set: #textColor for: #PluggableListMorph to: self darkContentEmphasized;
		set: #selectionColor for: #PluggableListMorph to: self darkSelectionColor;
		set: #selectionTextColor for: #PluggableListMorph to: self darkSelectionTextColor;
		set: #filterColor for: #PluggableListMorph to: self yellow;
		set: #filterTextColor for: #PluggableListMorph to: self base03;
		set: #preSelectionModifier for: #PluggableListMorph to: [ [:c | c lighter alpha: 0.5 ] ];
		set: #hoverSelectionModifier for: #PluggableListMorph to: [ [:c | c lighter alpha: 0.5 ] ].
		
	"Tree widgets"
	theme
		set: #highlightTextColor for: #SimpleHierarchicalListMorph to: self yellow lighter lighter;
		set: #lineColor for: #SimpleHierarchicalListMorph to: self darkContentSecondary.
	
	"Text widgets"
	theme
		set: #textColor for: #PluggableTextMorph to: self darkContentPrimary;
		set: #caretColor for: #PluggableTextMorph to: self darkContentEmphasizedMore;
		set: #selectionColor for: #PluggableTextMorph to: self darkSelectionColor;
		set: #unfocusedSelectionModifier for: #PluggableTextMorph to: [ [:c | c darker ] ];
		set: #adornmentReadOnly for: #PluggableTextMorph to: self magenta;
		set: #adornmentRefuse for: #PluggableTextMorph to: self cyan;
		set: #adornmentConflict for: #PluggableTextMorph to: self red;
		set: #adornmentDiff for: #PluggableTextMorph to: self green;
		set: #adornmentNormalEdit for: #PluggableTextMorph to: self orange;
		set: #adornmentDiffEdit for: #PluggableTextMorph to: self yellow.
	theme
		set: #balloonTextColor for: #PluggableTextMorphPlus to: self darkContentSecondary.