actions
brushable
	"Return true if the current tool uses a brush."
	^ (#("non-brushable" eyedropper: fill: pickup: stamp:) indexOf: action) = 0