initialize
initialize
	"Initialize a new Morphic Project"
	super initialize.
	world := PasteUpMorph newWorldForProject: self.
	self setWorldBackground: true.
	Locale switchToID: (CurrentProject
	    ifNotNil: [ CurrentProject localeID ]
	    ifNil: [ LocaleID isoLanguage: 'en' ]).
	Preferences useVectorVocabulary ifTrue: [world installVectorVocabulary]
