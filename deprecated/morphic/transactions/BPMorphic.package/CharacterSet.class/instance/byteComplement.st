conversion
byteComplement
	"return a character set containing precisely the single byte characters
	the receiver does not"
	| _gsSqueakTemp_set |
	_gsSqueakTemp_set := CharacterSet allCharacters.
	self
		do: [:c | _gsSqueakTemp_set remove: c].
	^ _gsSqueakTemp_set