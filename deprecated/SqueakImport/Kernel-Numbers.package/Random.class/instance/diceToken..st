die rolling
diceToken: stream
	"Private. Mini scanner, see #roll:"

	stream atEnd ifTrue: [^ nil].
	stream peek isDigit ifTrue: [^ Number readFrom: stream].
	^ stream next asLowercase