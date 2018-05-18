class initialization
initialize
	"WorldState initialize"

	MinCycleLapse := 20.		"allows 50 frames per second..."
	DisableDeferredUpdates := false.
	DeferredUIMessages := SharedQueue new.