connectorstext-parts bin
boldAuthoringPrototype
	"TextMorph boldAuthoringPrototype openInHand"
	| _gsSqueakTemp_text |
	_gsSqueakTemp_text := Text string: 'Text' translated attributes: {TextEmphasis bold}.
	^ self new contentsWrapped: _gsSqueakTemp_text;
		 fontName: 'BitstreamVeraSans' pointSize: 24;
		 paragraph;
		 extent: 79 @ 36;
		 margins: 4 @ 0;
		 fit;
		 yourself