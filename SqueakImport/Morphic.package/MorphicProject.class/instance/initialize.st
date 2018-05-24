initialize
initialize
	"Initialize a new Morphic Project"
	super initialize.
	world := PasteUpMorph newWorldForProject: self.
	self setWorldBackground: true.
	Locale switchToID: CurrentProject localeID.
	Preferences useVectorVocabulary ifTrue: [world installVectorVocabulary]