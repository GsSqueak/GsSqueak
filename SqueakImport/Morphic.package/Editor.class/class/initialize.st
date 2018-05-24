class initialization
initialize
	"
	Editor initialize
	"
	self initializeKeystrokeActions.
	self allSubclassesDo: [ :c | c initialize ]