window construction
entryRowWithLabel: label labelWidth: lWidth balloonText: balloonText getFieldText: getTextSelector setFieldText: setTextSelector buttonLabel: buttonLabel buttonAction: buttonAction buttonBalloonText: buttonBalloonText 
	| row tm |
	row := Morph new color: Color transparent;
				 hResizing: #spaceFill;
				 vResizing: #spaceFill;
				 extent: 550 @ 40;
				 layoutPolicy: ProportionalLayout new;
				 borderWidth: 2;
				 setBalloonText: balloonText translated;
				 yourself.
	row
		addMorph: (TextMorph new contents: label translated asText allBold) lock
		fullFrame: (LayoutFrame
				fractions: (0 @ 0 corner: 0 @ 1)
				offsets: (3 @ 3 corner: lWidth @ -3)).
	row
		addMorph: ((tm := PluggableTextMorph
				on: self
				text: getTextSelector
				accept: setTextSelector) hideVScrollBarIndefinitely: true;
				 acceptOnCR: true)
		fullFrame: (LayoutFrame
				fractions: (0 @ 0 corner: 1 @ 1)
				offsets: (lWidth + 10 @ 0 corner: (lWidth / 1.8 + 10) negated @ 0)).
	"Make the background a solid color so that eventual bleed from the labels doesn't make the entire input field unreadable. Happens when the bold font is significantly wider than the non-bold font or when the spacing of the font doesn't match the guess above"
	tm color: (Color gray: 0.9).
	buttonAction
		ifNotNil: [row
				addMorph: (SimpleButtonMorph new target: self;
						 label: buttonLabel translated;
						 actionSelector: buttonAction;
						 hResizing: #spaceFill;
						 setBalloonText: buttonBalloonText translated)
				fullFrame: (LayoutFrame
						fractions: (1 @ 0 corner: 1 @ 1)
						offsets: ((lWidth / 1.8 + 5) negated @ 3 corner: -5 @ -3))].
	^ row