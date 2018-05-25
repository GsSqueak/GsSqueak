*SqCharacter-converting
to: other
	"Answer with a collection in ascii order -- $a to: $z"
	^ (self asInteger to: other asciiValue)
		collect:	[:ascii | Character value: ascii]
		as: String
