content-types
guessTypeFromExtension: ext
	"guesses a content type from the extension"
	| extension |
	extension := ext asString.
	(extension includes: $.) ifTrue: [ ^self defaultContentType].

	MIMEdatabase ifNil: [self resetMIMEdatabase].
	^ MIMEdatabase at: extension ifAbsent: [self defaultContentType].