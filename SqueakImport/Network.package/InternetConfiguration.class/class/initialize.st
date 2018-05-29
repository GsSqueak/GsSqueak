initialize-release
initialize
	"self initialize"
	Smalltalk addToStartUpList: self.
	Smalltalk addToShutDownList: self.