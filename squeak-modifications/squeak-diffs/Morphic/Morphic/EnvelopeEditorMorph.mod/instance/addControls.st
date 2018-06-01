construction
addControls
	| chooser |
	chooser := PopUpChoiceMorph new extent: 110@14;
		contentsClipped: 'Editing: ' , envelope name;
		target: self;
		actionSelector: #chooseFrom:envelopeItem:;
		getItemsSelector: #curveChoices.
	chooser arguments: (Array with: chooser).
	self addMorph: chooser.
	chooser align: chooser bounds topLeft with: graphArea bounds bottomLeft + (0@5).

	chooser := PopUpChoiceMorph new extent: 130@14;
		contentsClipped: 'Timbre: ' , soundName;
		target: self;
		actionSelector: #chooseFrom:soundItem:;
		getItemsSelector: #soundChoices.
	chooser arguments: (Array with: chooser).
	self addMorph: chooser.
	chooser align: chooser bounds topRight with: graphArea bounds bottomRight + (-50@5).
