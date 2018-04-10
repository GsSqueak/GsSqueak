private
retrieveLastCharacterWidth
	| _gsSqueakTemp_lastCharacter |
	lastIndex > text size
		ifTrue: [^ lastCharacterWidth := 0].
	specialWidth
		ifNotNil: [^ lastCharacterWidth := specialWidth].
	_gsSqueakTemp_lastCharacter := text at: lastIndex.
	(_gsSqueakTemp_lastCharacter charCode >= 256
			or: [(stopConditions at: _gsSqueakTemp_lastCharacter charCode + 1) isNil])
		ifTrue: [lastCharacterWidth := font
						widthOf: (text at: lastIndex)].
	"if last character was a stop condition, then the width is already set"
	^ lastCharacterWidth