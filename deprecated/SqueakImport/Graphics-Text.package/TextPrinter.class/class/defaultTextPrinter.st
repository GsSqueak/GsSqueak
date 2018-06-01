accessing
defaultTextPrinter
	"This is the global default TextPrinter instance."
	DefaultTextPrinter isNil ifTrue: [DefaultTextPrinter := self new].
	^DefaultTextPrinter