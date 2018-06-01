parts bin
borderedPrototype
	| _gsSqueakTemp_t |
	_gsSqueakTemp_t := self authoringPrototype.
	_gsSqueakTemp_t fontName: 'BitstreamVeraSans' pointSize: 24.
	_gsSqueakTemp_t autoFit: false;
		 extent: 250 @ 100.
	_gsSqueakTemp_t borderWidth: 1;
		 margins: 4 @ 0;
		 backgroundColor: Color white.
	"Strangeness here in order to avoid two offset copies of the default
	contents when operating in an mvc project before cursor enters the
	morphic window"
	_gsSqueakTemp_t paragraph.
	^ _gsSqueakTemp_t