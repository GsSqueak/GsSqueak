instance creation
addLightScrollables: theme
	"self createLight apply."

	"Scroll bars"
	theme
		set: #thumbColor for: #ScrollBar to: self lightBackground;
		set: #thumbBorderColor for: #ScrollBar to: self lightBackground;
		set: #thumbBorderWidth for: #ScrollBar to: 1;
		set: #thumbColorModifier for: #ScrollBar to: [ [:c | c adjustBrightness: -0.1] ];
		set: #pagingAreaColorModifier for: #ScrollBar to: [ [:c | Color transparent ] ];
		set: #borderColorModifier for: #ScrollBar to: [ [:c | c adjustBrightness: -0.1] ].
	
	"Scroll panes (includes generic stuff for list widgets, tree widgets, and text widgets."
	theme
		set: #borderWidth for: #ScrollPane to: 0;
	"	set: #borderColor for: #ScrollPane to: Color transparent;"
		set: #color for: #ScrollPane to: self lightBackground.
		
	"List widgets"
	theme
		set: #textColor for: #PluggableListMorph to: self lightContentEmphasized;
		set: #selectionColor for: #PluggableListMorph to: self lightBackgroundHighlights;
		set: #selectionTextColor for: #PluggableListMorph to: self lightContentEmphasizedMore;
		derive: #multiSelectionColor for: #PluggableListMorph from: #PluggableListMorph at: #selectionColor do: [:c | c darker];
		set: #filterColor for: #PluggableListMorph to: self yellow;
		set: #filterTextColor for: #PluggableListMorph to: self lightBackground;
		set: #preSelectionModifier for: #PluggableListMorph to: [ [:c | c darker alpha: 0.5 ] ];
		set: #hoverSelectionModifier for: #PluggableListMorph to: [ [:c | c darker alpha: 0.5 ] ].
		
	"Tree widgets"
	theme
		set: #highlightTextColor for: #SimpleHierarchicalListMorph to: self yellow lighter lighter;
		set: #lineColor for: #SimpleHierarchicalListMorph to: self lightContentSecondary.
	
	"Text widgets"
	theme
		set: #textColor for: #PluggableTextMorph to: self lightContentPrimary;
		set: #caretColor for: #PluggableTextMorph to: self lightContentEmphasizedMore;
		set: #selectionColor for: #PluggableTextMorph to: self lightBackgroundHighlights;
		set: #unfocusedSelectionModifier for: #PluggableTextMorph to: [ [:c | (Color r: 0.933 g: 0.909 b: 0.835) "light background highlights"] ];
		set: #adornmentReadOnly for: #PluggableTextMorph to: self magenta;
		set: #adornmentRefuse for: #PluggableTextMorph to: self cyan;
		set: #adornmentConflict for: #PluggableTextMorph to: self red;
		set: #adornmentDiff for: #PluggableTextMorph to: self green;
		set: #adornmentNormalEdit for: #PluggableTextMorph to: self orange;
		set: #adornmentDiffEdit for: #PluggableTextMorph to: self yellow.
	theme
		set: #balloonTextColor for: #PluggableTextMorphPlus to: self lightContentSecondary.