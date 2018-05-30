system introspecting
classOrTraitFrom: environment pattern: pattern label: label
	"If there is a class or trait whose name exactly given by pattern, return it.
	If there is only one class or trait in the given environment whose name matches pattern, return it.
	Otherwise, put up a menu offering the names of all classes that match pattern, and return the class chosen, else nil if nothing chosen.
	This method ignores separator characters in the pattern"
	
	| toMatch potentialNames names exactMatch lines reducedIdentifiers selectedIndex |
	toMatch := pattern copyWithoutAll: Character separators.
	toMatch ifEmpty: [ ^nil ].
	"If there's a class or trait named as pattern, then return it."
	Symbol hasInterned: pattern ifTrue: [ :symbol |
		environment at: symbol ifPresent: [ :maybeClassOrTrait |
			((maybeClassOrTrait isKindOf: Class) or: [
				maybeClassOrTrait isTrait ])
					ifTrue: [ ^maybeClassOrTrait ] ] ].
	"No exact match, look for potential matches."
	toMatch := pattern asLowercase copyWithout: $..
	potentialNames := (environment classAndTraitNames) asOrderedCollection.
	names := pattern last = $. "This is some old hack, using String>>#match: may be better."
		ifTrue: [ potentialNames select: [ :each | each asLowercase = toMatch ] ]
		ifFalse: [
			potentialNames select: [ :each |
				each includesSubstring: toMatch caseSensitive: false ] ].
	exactMatch := names detect: [ :each | each asLowercase = toMatch ] ifNone: [ nil ].
	lines := OrderedCollection new.
	exactMatch ifNotNil: [ lines add: 1 ].
	"Also try some fuzzy matching."
	reducedIdentifiers := pattern suggestedTypeNames select: [ :each |
		potentialNames includes: each ].
	reducedIdentifiers ifNotEmpty: [
		names addAll: reducedIdentifiers.
		lines add: 1 + names size + reducedIdentifiers size ].
	"Let the user select if there's more than one possible match. This may give surprising results."
	names size = 0 ifTrue: [^ nil "nothing matches"].
	
	selectedIndex := names size = 1
		ifTrue: [ 1 ]
		ifFalse: [
			exactMatch ifNotNil: [ names addFirst: exactMatch ].
			self chooseFrom: names lines: lines title: label ].
	selectedIndex = 0 ifTrue: [ ^nil ].
	^environment at: (names at: selectedIndex) asSymbol