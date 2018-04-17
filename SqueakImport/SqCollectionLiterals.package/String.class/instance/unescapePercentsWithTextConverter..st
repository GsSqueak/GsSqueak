converting
unescapePercentsWithTextConverter: aTextConverter
	"decode string including %XX form"

	| unescaped |
	unescaped := self unescapePercentsRaw.
	^[ unescaped convertFromWithConverter: aTextConverter ]
		on: Error
		do: ["the contents may be squeak-encoded"
			unescaped ]