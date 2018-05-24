instance creation
addDarkScrollables: aUserInterfaceTheme
	"self createDark apply."
	"Scroll bars"
	aUserInterfaceTheme
		set: #thumbColor for: #ScrollBar to: self dbGray;
		set: #thumbBorderColor for: #ScrollBar to: self dbGray twiceDarker.
	"Scroll panes (includes generic stuff for list widgets, tree widgets, and text widgets."
	aUserInterfaceTheme
		set: #borderColor for: #ScrollPane to: (Color transparent) ; "So the search box isn't outlined."
		set: #color for: #ScrollPane to: self dbBackground.
	"List widgets"
	aUserInterfaceTheme
		set: #textColor for: #PluggableListMorph to: (Color gray: 0.9);
		set: #selectionColor for: #PluggableListMorph to: self dbSelection;
		set: #selectionTextColor for: #PluggableListMorph to: Color white ;
		derive: #multiSelectionColor for: #PluggableListMorph from: #PluggableListMorph at: #selectionColor do: [:c | c twiceDarker];
		set: #filterColor for: #PluggableListMorph to: (self dbYellow alpha: 0.4);
		derive: #filterTextColor for: #PluggableListMorph from: #PluggableListMorph at: #textColor ;
		set: #preSelectionModifier for: #PluggableListMorph to: [ [:c | c twiceDarker ] ];
		set: #hoverSelectionModifier for: #PluggableListMorph to: [ [:c | c twiceDarker alpha: 0.5 ] ].
	"Tree widgets"
	aUserInterfaceTheme
		set: #highlightTextColor for: #SimpleHierarchicalListMorph to: self dbYellow lighter lighter;
		set: #lineColor for: #SimpleHierarchicalListMorph to: Color gray.
	"Text widgets"
	aUserInterfaceTheme
		set: #textColor for: #PluggableTextMorph to: (Color gray: 0.9);
		set: #caretColor for: #PluggableTextMorph to: Color orange darker;
		set: #selectionColor for: #PluggableTextMorph to: (self dbSelection duller duller);
		set: #unfocusedSelectionModifier for: #PluggableTextMorph to: [ [:c | c duller] ];
		set: #adornmentReadOnly for: #PluggableTextMorph to: self dbPurple;
		set: #adornmentRefuse for: #PluggableTextMorph to: self dbBlue;
		set: #adornmentConflict for: #PluggableTextMorph to: self dbRed;
		set: #adornmentDiff for: #PluggableTextMorph to: self dbGreen;
		set: #adornmentNormalEdit for: #PluggableTextMorph to: self dbOrange;
		set: #adornmentDiffEdit for: #PluggableTextMorph to: self dbYellow;
		set: #frameAdornmentWidth for: #PluggableTextMorph to: 2.
	aUserInterfaceTheme
		set: #balloonTextColor for: #PluggableTextMorphPlus to: Color lightGray