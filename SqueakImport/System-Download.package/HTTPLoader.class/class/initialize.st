class initialization
initialize
	"HTTPLoader initialize"

	MaxNrOfConnections := 4.
	DefaultLoader ifNotNil: [
		DefaultLoader release.
		DefaultLoader := nil]