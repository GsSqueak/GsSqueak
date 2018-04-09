*SqCollectionLiterals-converting
unescapePercents
	"decode %xx form.  This is the opposite of #encodeForHTTP. Assume UTF-8 encoding by default."
	
	| unescaped |
	unescaped := self unescapePercentsRaw.
	^[ unescaped utf8ToSqueak ]
		on: Error
		do: [ unescaped ]
