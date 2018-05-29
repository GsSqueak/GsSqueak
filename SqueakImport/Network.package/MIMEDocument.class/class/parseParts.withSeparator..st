instance creation
parseParts: bodyText withSeparator: separator
	"private -- parse the parts of the message and store them into a collection"

	| parseStream msgStream messages  normalizedSeparator |
	
	parseStream := ReadStream on: bodyText.
	
	msgStream := LimitingLineStreamWrapper on: parseStream delimiter: separator.
	normalizedSeparator := separator asLowercase.
	msgStream limitingBlock: [:aLine | | normalizedLine |
		normalizedLine := aLine withoutTrailingBlanks asLowercase.
		normalizedLine = normalizedSeparator or:	"Match the separator"
		[normalizedLine = ('--',normalizedSeparator)] or:	"or -- and the separator"	
		[normalizedLine = (normalizedSeparator, '--')]].	"or the final separator with --"

	"Throw away everything up to and including the first separator"
	msgStream upToEnd.
	msgStream skipThisLine.

	"Extract each of the multi-parts as strings"
	messages := OrderedCollection new.
	[parseStream atEnd]
		whileFalse: 
			[messages add: msgStream upToEnd.
			msgStream skipThisLine].

	^ messages collect: [:e | MIMEDocument fromPartString: e]