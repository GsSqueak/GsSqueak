parts bin
fancyPrototype
	| _gsSqueakTemp_t |
	_gsSqueakTemp_t := self authoringPrototype.
	_gsSqueakTemp_t autoFit: false;
		 extent: 150 @ 75.
	_gsSqueakTemp_t borderWidth: 2;
		 margins: 4 @ 0;
		 useRoundedCorners.
	"Why not rounded?"
	"fancy font, shadow, rounded"
	_gsSqueakTemp_t fontName: Preferences standardEToysFont familyName size: 18;
		 textColor: Color blue;
		 backgroundColor: Color lightBrown.
	_gsSqueakTemp_t addDropShadow.
	"Strangeness here in order to avoid two offset copies of the default
	contents when operating in an mvc project before cursor enters the
	morphic window"
	_gsSqueakTemp_t paragraph.
	^ _gsSqueakTemp_t