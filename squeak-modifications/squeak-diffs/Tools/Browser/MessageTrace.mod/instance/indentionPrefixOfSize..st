indenting
indentionPrefixOfSize: levelInteger

	| answer |
	answer := String new: levelInteger * self indentionSize.
	answer atAllPut: $ . "space"
	^answer
