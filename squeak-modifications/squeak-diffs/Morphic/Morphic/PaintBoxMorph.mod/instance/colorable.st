actions
colorable
	"Return true if the current tool uses a color."
	^ (#("These use no color" erase: eyedropper: "fill: does" pickup: stamp:) indexOf: action) = 0