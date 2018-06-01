private
httpEncodeSafely: aUrl
	"Encode the url but skip $/ and $:."

	| unescaped |
	unescaped := aUrl unescapePercents.

	^ unescaped encodeForHTTPWithTextEncoding: 'utf-8'
		conditionBlock: [:c | c isSafeForHTTP or: [c = $/ or: [c = $:]]].
