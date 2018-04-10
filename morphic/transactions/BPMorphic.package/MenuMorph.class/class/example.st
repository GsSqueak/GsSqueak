example
example
	"MenuMorph example popUpInWorld"
	| _gsSqueakTemp_menu |
	_gsSqueakTemp_menu := MenuMorph new.
	_gsSqueakTemp_menu addTitle: 'Fruit' translated.
	_gsSqueakTemp_menu addStayUpItem.
	_gsSqueakTemp_menu add: 'apples' action: #apples.
	_gsSqueakTemp_menu add: 'oranges' action: #oranges.
	_gsSqueakTemp_menu addLine.
	_gsSqueakTemp_menu addLine.
	"extra lines ignored"
	_gsSqueakTemp_menu add: 'peaches' action: #peaches.
	_gsSqueakTemp_menu addLine.
	_gsSqueakTemp_menu add: 'pears' action: #pears.
	_gsSqueakTemp_menu addLine.
	^ _gsSqueakTemp_menu