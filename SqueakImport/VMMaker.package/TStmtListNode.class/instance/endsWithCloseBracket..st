testing
endsWithCloseBracket: aStream
	"Answer true if the given stream ends in a $} character."

	| ch pos |
	(pos := aStream position) > 0 ifTrue: [
		aStream position: pos - 1.
		ch := aStream next].
	^ ch = $}
