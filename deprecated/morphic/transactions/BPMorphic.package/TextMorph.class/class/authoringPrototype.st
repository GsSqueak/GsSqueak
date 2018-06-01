scripting
authoringPrototype
	| _gsSqueakTemp_t |
	_gsSqueakTemp_t := super authoringPrototype.
	_gsSqueakTemp_t contents: 'abc' translated asText.
	_gsSqueakTemp_t wrapFlag: true.
	"Strangeness here in order to avoid two offset copies of the default
	contents when operating in an mvc project before cursor enters the
	morphic window"
	_gsSqueakTemp_t paragraph.
	^ _gsSqueakTemp_t