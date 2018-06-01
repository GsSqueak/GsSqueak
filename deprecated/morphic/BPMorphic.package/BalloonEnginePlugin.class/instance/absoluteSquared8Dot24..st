private
absoluteSquared8Dot24: value 
	"Compute the squared value of a 8.24 number with 0.0 <= value <
	1.0, e.g., compute (value * value) bitShift: -24"
	| _gsSqueakTemp_word1 _gsSqueakTemp_word2 |
	_gsSqueakTemp_word1 := value bitAnd: 65535.
	_gsSqueakTemp_word2 := (value bitShift: -16)
				bitAnd: 255.
	^ (_gsSqueakTemp_word1 * _gsSqueakTemp_word1 bitShift: -16)
		+ (_gsSqueakTemp_word1 * _gsSqueakTemp_word2 * 2)
		+ (_gsSqueakTemp_word2 * _gsSqueakTemp_word2 bitShift: 16) bitShift: -8