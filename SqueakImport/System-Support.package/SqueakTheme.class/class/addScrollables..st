instance creation
addScrollables: theme
	"self create apply"
	
	"Sliders"
	theme
		set: #borderColor for: #Slider to: Color gray;
		set: #borderWidth for: #Slider to: 1;
		set: #color for: #Slider to: Color lightGray;
		set: #thumbBorderColor for: #Slider to: [Color gray: 0.6];
		set: #thumbBorderWidth for: #Slider to: 0;
		set: #thumbColor for: #Slider to: Color veryVeryLightGray;
		set: #thumbShadowModifier for: #Slider to: [ [:c | c alpha: 0.7] ].
				
	"Scroll bars"
	theme
		set: #thumbBorderWidth for: #ScrollBar to: 1;
		set: #thumbColorModifier for: #ScrollBar to: [ [:c | c] ];
		set: #pagingAreaColorModifier for: #ScrollBar to: [ [:c | c darker alpha: 0.35] ];
		set: #borderColorModifier for: #ScrollBar to: [ [:c | c adjustBrightness: -0.3] ].
	
	"Scroll panes (includes generic stuff for list widgets, tree widgets, and text widgets."
	theme
		set: #borderColor for: #ScrollPane to: (Color gray: 0.6);
		set: #borderWidth for: #ScrollPane to: 1;
		set: #borderStyle for: #ScrollPane to: BorderStyle default;
		set: #color for: #ScrollPane to: Color white.
		
	"List widgets"
	theme
		set: #font for: #PluggableListMorph to: [Preferences standardListFont];
		set: #textColor for: #PluggableListMorph to: Color black;
		set: #selectionColor for: #PluggableListMorph to: (Color r: 0.72 g: 0.72 b: 0.9);
		derive: #multiSelectionColor for: #PluggableListMorph from: #PluggableListMorph at: #selectionColor do: [:c | c lighter];
		set: #selectionTextColor for: #PluggableListMorph to: Color black;
		set: #filterColor for: #PluggableListMorph to: Color yellow paler;
		set: #filterTextColor for: #PluggableListMorph to: Color black;
		set: #preSelectionModifier for: #PluggableListMorph to: [ [:c | Color gray: 0.9] ];
		set: #hoverSelectionModifier for: #PluggableListMorph to: [ [:c | c darker alpha: 0.3] ].
		
	"Tree widgets"
	theme
		derive: #font for: #SimpleHierarchicalListMorph from: #PluggableListMorph;
		derive: #textColor for: #SimpleHierarchicalListMorph from: #PluggableListMorph;
		derive: #selectionColor for: #SimpleHierarchicalListMorph from: #PluggableListMorph;
		derive: #selectionTextColor for: #SimpleHierarchicalListMorph from: #PluggableListMorph;
		derive: #filterColor for: #SimpleHierarchicalListMorph from: #PluggableListMorph;
		derive: #filterTextColor for: #SimpleHierarchicalListMorph from: #PluggableListMorph;
		derive: #hoverSelectionModifier for: #SimpleHierarchicalListMorph from: #PluggableListMorph;
		
		set: #higlightTextColor for: #SimpleHierarchicalListMorph to: Color red;
		set: #lineColor for: #SimpleHierarchicalListMorph to: Color veryLightGray.
	
	"Text widgets"
	theme
		set: #font for: #PluggableTextMorph to: [Preferences standardSystemFont];
		set: #textColor for: #PluggableTextMorph to: Color black;
		set: #caretColor for: #PluggableTextMorph to: Color red;
		set: #selectionColor for: #PluggableTextMorph to: (TranslucentColor r: 0.0 g: 0.0 b: 0.8 alpha: 0.2);
		set: #unfocusedSelectionModifier for: #PluggableTextMorph to: [ [:c | Color gray: 0.9] ];
		set: #adornmentReadOnly for: #PluggableTextMorph to: Color black;
		set: #adornmentRefuse for: #PluggableTextMorph to: Color tan;
		set: #adornmentConflict for: #PluggableTextMorph to: Color red;
		set: #adornmentDiff for: #PluggableTextMorph to: Color green;
		set: #adornmentNormalEdit for: #PluggableTextMorph to: Color orange;
		set: #adornmentDiffEdit for: #PluggableTextMorph to: Color yellow;
		set: #frameAdornmentWidth for: #PluggableTextMorph to: 1.
	theme
		set: #balloonTextColor for: #PluggableTextMorphPlus to: (Color gray: 0.7);
		derive: #balloonTextFont for: #PluggableTextMorphPlus from: #PluggableTextMorph at: #font.