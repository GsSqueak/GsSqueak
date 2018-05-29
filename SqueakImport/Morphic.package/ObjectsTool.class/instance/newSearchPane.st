search
newSearchPane
	"Answer a type-in pane for searches"

	| aTextMorph |
	aTextMorph := TextMorph new
		setProperty: #defaultContents toValue: ('' asText allBold addAttribute: (TextFontChange font3));
		setTextStyle: (TextStyle fontArray: { Preferences standardEToysFont });
		setDefaultContentsIfNil;
		on: #keyStroke send: #searchPaneCharacter: to: self;
		setNameTo: 'SearchPane';
		setBalloonText: 'Type here and all entries that match will be shown.' translated;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		margins: 4@6;
		backgroundColor: Color white.
	^ aTextMorph