class initialization
initialize
"
	self initialize
"

	| tt |
	tt := TTCFontDescription default.
	tt ifNotNil: [self newTextStyleFromTT: {tt}].
