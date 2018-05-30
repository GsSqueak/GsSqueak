initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	"#stop, #playOnce, or #loop"
	playMode := #stop.
	msecsPerFrame := 200.
	rotationDegrees := 0.
	scalePoint := 1.0 @ 1.0.
	frameList := Array empty.
	currentFrameIndex := 1.
	dwellCount := 0