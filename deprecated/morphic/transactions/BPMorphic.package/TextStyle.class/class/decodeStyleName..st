utilities
decodeStyleName: styleName 
	"Given a string styleName, return a collection with: 
	
	* [1] the probable Squeak emphasis code, which is a bit combination
	of: 
	1	bold 
	2	italic 
	4	underlined 
	8	narrow 
	16	strikeout 
	
	* [2] the base style name without the modifiers (can be empty)
	* [3] the modifiers in the order they were found 
	* [4] the codes for those modifiers, in the same order
	"
	| _gsSqueakTemp_decoder _gsSqueakTemp_keys _gsSqueakTemp_modifiers _gsSqueakTemp_modifierCodes _gsSqueakTemp_baseName _gsSqueakTemp_styleCode _gsSqueakTemp_matchedKey |
	_gsSqueakTemp_decoder := self styleDecoder.
	_gsSqueakTemp_modifiers := OrderedCollection new.
	_gsSqueakTemp_modifierCodes := OrderedCollection new.
	_gsSqueakTemp_keys := _gsSqueakTemp_decoder keys asArray
				sort: [:a :b | a size > b size].
	_gsSqueakTemp_styleCode := 0.
	_gsSqueakTemp_baseName := styleName asString.
	[_gsSqueakTemp_matchedKey := _gsSqueakTemp_keys
				detect: [:k | _gsSqueakTemp_baseName endsWith: k]
				ifNone: [].
	_gsSqueakTemp_matchedKey notNil]
		whileTrue: [| last code |
			last := _gsSqueakTemp_baseName size - _gsSqueakTemp_matchedKey size.
			last > 0
				ifTrue: [('- '
							includes: (_gsSqueakTemp_baseName at: last))
						ifTrue: [last := last - 1]].
			_gsSqueakTemp_baseName := _gsSqueakTemp_baseName copyFrom: 1 to: last.
			code := _gsSqueakTemp_decoder at: _gsSqueakTemp_matchedKey.
			_gsSqueakTemp_styleCode := _gsSqueakTemp_styleCode + code.
			_gsSqueakTemp_modifiers addFirst: _gsSqueakTemp_matchedKey.
			_gsSqueakTemp_modifierCodes addFirst: code].
	^ {_gsSqueakTemp_styleCode. _gsSqueakTemp_baseName. _gsSqueakTemp_modifiers. _gsSqueakTemp_modifierCodes}