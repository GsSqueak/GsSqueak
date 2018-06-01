instance creation
createClassic
	"self createClassic"
	
	^ (self named: 'Squeak (classic code style)') in: [:theme |
		theme link: (self named: 'Squeak').
		self addClassicSyntaxHighlighting: theme.
		theme]