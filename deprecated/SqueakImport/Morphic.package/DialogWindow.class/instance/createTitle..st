initialization
createTitle: aString 
	"Mimick behavior of MenuMorph title creation."
	
	| box closeButton menuButton |
	box := Morph new
		name: #title;
		changeTableLayout;
		listDirection: #leftToRight;
		listCentering: #justified;
		yourself.
	
	titleMorph := aString asText asMorph lock.

	closeButton := SystemWindowButton new
		color: Color transparent;
		target: self;
		extent: 12@12;
		actionSelector: #cancelDialog;
		balloonText: 'Cancel this dialog' translated;
		borderWidth: 0;
		labelGraphic: SystemWindow closeBoxImage;
		extent: SystemWindow closeBoxImage extent;
		visible: self class includeCloseButton;
		yourself.

	menuButton := SystemWindowButton new
		color: Color transparent;
		target: self;
		actionSelector: #offerDialogMenu;
		balloonText: 'Dialog menu' translated;
		borderWidth: 0;
		labelGraphic: SystemWindow menuBoxImage;
		extent: SystemWindow menuBoxImage extent;
		visible: self class includeControlMenu;
		yourself.
	
	box addAllMorphs: {closeButton. titleMorph. menuButton}.
	
	self addMorphBack: box.
	self setTitleParameters.
