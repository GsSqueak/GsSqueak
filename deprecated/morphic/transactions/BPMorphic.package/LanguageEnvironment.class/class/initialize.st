class initialization
initialize
	"LanguageEnvironment initialize"
	Smalltalk addToStartUpList: LanguageEnvironment after: FileDirectory.
	Smalltalk addToStartUpList: FileDirectory after: LanguageEnvironment