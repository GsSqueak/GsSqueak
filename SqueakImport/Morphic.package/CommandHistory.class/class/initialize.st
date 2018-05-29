class initialization
initialize
	"CommandHistory initialize"

	Smalltalk addToStartUpList: self.
	Smalltalk addToShutDownList: self.