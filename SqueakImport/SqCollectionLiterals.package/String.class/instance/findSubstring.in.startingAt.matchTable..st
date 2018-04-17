accessing
findSubstring: key in: body startingAt: start matchTable: matchTable
	"Answer the index in the string body at which the substring key first occurs, at or beyond start.  The match is determined using matchTable, which can be used to effect, eg, case-insensitive matches.  If no match is found, zero will be returned."

	| index c1 c2 keySize matchTableSize |
	(keySize := key size) = 0 ifTrue: [ ^0 ].
	matchTable ifNil: [
		start to: body size - keySize + 1 do: [ :startIndex |
			index := 0.
			[ (body at: startIndex + index) == (key at: (index := index + 1)) ] whileTrue: [
				index = keySize ifTrue: [ ^startIndex ] ] ].
		^0 ].
	matchTableSize := matchTable size.
	start to: body size - keySize + 1 do: [ :startIndex |
		index := 0.
		[
			(c1 := (body basicAt: startIndex + index) + 1) <= matchTableSize ifTrue: [
				c1 := matchTable at: c1 ].
			(c2 := (key basicAt: (index := index + 1)) + 1) <= matchTableSize ifTrue: [
				c2 := matchTable at: c2 ].
			c1 = c2 ]
			whileTrue: [
				index = keySize ifTrue: [ ^startIndex ] ] ].
	^0