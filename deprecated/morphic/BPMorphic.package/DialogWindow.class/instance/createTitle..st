initialization
createTitle: aString 
	"Mimick behavior of MenuMorph title creation."
	| _gsSqueakTemp_box _gsSqueakTemp_closeButton _gsSqueakTemp_menuButton |
	_gsSqueakTemp_box := Morph new name: #title;
				 changeTableLayout;
				 listDirection: #leftToRight;
				 listCentering: #justified;
				 yourself.
	titleMorph := aString asText asMorph lock.
	_gsSqueakTemp_closeButton := SystemWindowButton new color: Color transparent;
				 target: self;
				 extent: 12 @ 12;
				 actionSelector: #cancelDialog;
				 balloonText: 'Cancel this dialog' translated;
				 borderWidth: 0;
				 labelGraphic: SystemWindow closeBoxImage;
				 extent: SystemWindow closeBoxImage extent;
				 yourself.
	_gsSqueakTemp_menuButton := SystemWindowButton new color: Color transparent;
				 target: self;
				 actionSelector: #offerDialogMenu;
				 balloonText: 'Dialog menu' translated;
				 borderWidth: 0;
				 labelGraphic: SystemWindow menuBoxImage;
				 extent: SystemWindow menuBoxImage extent;
				 yourself.
	_gsSqueakTemp_box addAllMorphs: {_gsSqueakTemp_closeButton. titleMorph. _gsSqueakTemp_menuButton}.
	self addMorphBack: _gsSqueakTemp_box.
	self setTitleParameters