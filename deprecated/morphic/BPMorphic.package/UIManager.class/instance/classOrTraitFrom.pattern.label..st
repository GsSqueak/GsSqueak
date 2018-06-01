system introspecting
classOrTraitFrom: environment pattern: pattern label: label 
	"If there is a class or trait whose name exactly given by pattern, return
	it. If there is only one class or trait in the given environment whose
	name matches pattern, return it.
	Otherwise, put up a menu offering the names of all classes that
	match pattern, and return the class chosen, else nil if nothing
	chosen. This method ignores separator characters in the pattern"
	| _gsSqueakTemp_toMatch _gsSqueakTemp_potentialNames _gsSqueakTemp_names _gsSqueakTemp_exactMatch _gsSqueakTemp_lines _gsSqueakTemp_reducedIdentifiers _gsSqueakTemp_selectedIndex |
	_gsSqueakTemp_toMatch := pattern copyWithoutAll: Character separators.
	_gsSqueakTemp_toMatch
		ifEmpty: [^ nil].
	"If there's a class or trait named as pattern, then return it."
	Symbol
		hasInterned: pattern
		ifTrue: [:symbol | environment
				at: symbol
				ifPresent: [:maybeClassOrTrait | ((maybeClassOrTrait isKindOf: Class)
							or: [maybeClassOrTrait isTrait])
						ifTrue: [^ maybeClassOrTrait]]].
	"No exact match, look for potential matches."
	_gsSqueakTemp_toMatch := pattern asLowercase copyWithout: $..
	_gsSqueakTemp_potentialNames := environment classAndTraitNames asOrderedCollection.
	_gsSqueakTemp_names := pattern last = $.
				ifTrue: ["This is some old hack, using String>>#match: may
					be better."
					_gsSqueakTemp_potentialNames
						select: [:each | each asLowercase = _gsSqueakTemp_toMatch]]
				ifFalse: [_gsSqueakTemp_potentialNames
						select: [:each | each includesSubstring: _gsSqueakTemp_toMatch caseSensitive: false]].
	_gsSqueakTemp_exactMatch := _gsSqueakTemp_names
				detect: [:each | each asLowercase = _gsSqueakTemp_toMatch]
				ifNone: [].
	_gsSqueakTemp_lines := OrderedCollection new.
	_gsSqueakTemp_exactMatch
		ifNotNil: [_gsSqueakTemp_lines add: 1].
	"Also try some fuzzy matching."
	_gsSqueakTemp_reducedIdentifiers := pattern suggestedTypeNames
				select: [:each | _gsSqueakTemp_potentialNames includes: each].
	_gsSqueakTemp_reducedIdentifiers
		ifNotEmpty: [_gsSqueakTemp_names addAll: _gsSqueakTemp_reducedIdentifiers.
			_gsSqueakTemp_lines add: 1 + _gsSqueakTemp_names size + _gsSqueakTemp_reducedIdentifiers size].
	"Let the user select if there's more than one possible match. This may
	give surprising results."
	_gsSqueakTemp_names size = 0
		ifTrue: [^ nil].
	_gsSqueakTemp_selectedIndex := _gsSqueakTemp_names size = 1
				ifTrue: [1]
				ifFalse: [_gsSqueakTemp_exactMatch
						ifNotNil: [_gsSqueakTemp_names addFirst: _gsSqueakTemp_exactMatch].
					self
						chooseFrom: _gsSqueakTemp_names
						lines: _gsSqueakTemp_lines
						title: label].
	_gsSqueakTemp_selectedIndex = 0
		ifTrue: [^ nil].
	^ environment at: (_gsSqueakTemp_names at: _gsSqueakTemp_selectedIndex) asSymbol