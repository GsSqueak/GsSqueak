initialization
initializeWithThumbnail: aThumbnail withLabel: aLabel andColor: aColor andSend: aSelector to: aReceiver 
	"Initialize the receiver to show aThumbnail on its face, giving it the
	label supplied and arranging for it, when the button goes down on it,
	to obtain a new morph by sending the supplied selector to the
	supplied receiver"
	| _gsSqueakTemp_labeledItem _gsSqueakTemp_nonTranslucent |
	_gsSqueakTemp_nonTranslucent := aColor asNontranslucentColor.
	_gsSqueakTemp_labeledItem := AlignmentMorph newColumn.
	_gsSqueakTemp_labeledItem color: _gsSqueakTemp_nonTranslucent.
	_gsSqueakTemp_labeledItem borderWidth: 0.
	_gsSqueakTemp_labeledItem layoutInset: 4 @ 0;
		 cellPositioning: #center.
	_gsSqueakTemp_labeledItem addMorph: aThumbnail.
	_gsSqueakTemp_labeledItem addMorphBack: (Morph new extent: 4 @ 4) beTransparent.
	_gsSqueakTemp_labeledItem addMorphBack: (TextMorph new backgroundColor: _gsSqueakTemp_nonTranslucent;
			 contentsAsIs: aLabel;
			 beAllFont: Preferences standardEToysFont;
			 centered).
	self beTransparent;
		labelGraphic: ((_gsSqueakTemp_labeledItem
				imageForm: 32
				backgroundColor: _gsSqueakTemp_nonTranslucent
				forRectangle: _gsSqueakTemp_labeledItem fullBounds)
				replaceColor: _gsSqueakTemp_nonTranslucent
				withColor: Color transparent); borderWidth: 0; target: aReceiver; actionSelector: #launchPartVia:label:; arguments: {aSelector. aLabel}; actWhen: #buttonDown.
	self stationarySetup