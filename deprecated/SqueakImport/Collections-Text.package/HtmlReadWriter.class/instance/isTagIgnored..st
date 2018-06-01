testing
isTagIgnored: aTag

	| space t |
	t := aTag copyWithoutAll: '</>'.
	space := t indexOf: Character space.
	t := space > 0
		ifTrue: [t copyFrom: 1 to: space - 1]
		ifFalse: [t].
	^ self ignoredTags includes: t