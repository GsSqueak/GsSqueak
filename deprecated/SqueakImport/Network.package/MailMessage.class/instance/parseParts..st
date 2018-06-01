multipart
parseParts: bodyText
	"private -- parse the parts of the message and store them into a collection"

	| parseStream msgStream messages separator |

	"If we can't find a valid separator, handle it as if the message is not multipart"
	separator := self attachmentSeparator.
	separator ifNil: [self error: 'Bad attachment separater'].

	separator := '--', separator withoutTrailingBlanks.
	parseStream := ReadStream on: bodyText.

	msgStream := LimitingLineStreamWrapper on: parseStream delimiter: separator.
	msgStream limitingBlock: [:aLine |
		aLine withoutTrailingBlanks = separator or:			"Match the separator"
		[aLine withoutTrailingBlanks = (separator, '--')]].	"or the final separator with --"

	"Throw away everything up to and including the first separator"
	msgStream upToEnd.
	msgStream skipThisLine.

	"Extract each of the multi-parts as strings"
	messages := OrderedCollection new.
	[parseStream atEnd]
		whileFalse: 
			[messages add: msgStream upToEnd.
			msgStream skipThisLine].

	^ messages collect: [:e | MIMEDocument from: e]