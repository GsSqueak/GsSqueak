initialization
initializeWithThumbnail: aThumbnail withLabel: aLabel andColor: aColor andSend: aSelector to: aReceiver 	
	"Initialize the receiver to show aThumbnail on its face, giving it the label supplied and arranging for it, when the button goes down on it, to obtain a new morph by sending the supplied selector to the supplied receiver"

	| labeledItem nonTranslucent |
	nonTranslucent := aColor asNontranslucentColor.
	labeledItem := AlignmentMorph newColumn.
	labeledItem color: nonTranslucent.
	labeledItem borderWidth: 0.
	labeledItem
		layoutInset: 4@0;
		cellPositioning: #center.
	labeledItem addMorph: aThumbnail.
	labeledItem addMorphBack: (Morph new extent: (4@4)) beTransparent.
	labeledItem addMorphBack: (TextMorph new
		backgroundColor: nonTranslucent;
		contentsAsIs: aLabel;
		beAllFont: Preferences standardEToysFont;
		centered).

	self
		beTransparent;
		labelGraphic: ((labeledItem imageForm: 32 backgroundColor: nonTranslucent forRectangle: labeledItem fullBounds) replaceColor: nonTranslucent withColor: Color transparent);
		borderWidth: 0;
		target: aReceiver;
		actionSelector: #launchPartVia:label:;
		arguments: {aSelector. aLabel};
		actWhen: #buttonDown.

	self stationarySetup.