content-types
guessTypeFromName: url
	"guesses a content type from the url"
	| extension |
	extension := url asString.
	(extension includes: $.) ifFalse: [ ^self defaultContentType].

	extension := (extension findTokens: '.') last asLowercase.

	MIMEdatabase ifNil: [self resetMIMEdatabase].
	^ MIMEdatabase at: extension ifAbsent: [self defaultContentType].
