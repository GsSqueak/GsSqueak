converting
asMouseMove
	"Convert the receiver into a mouse move"
	^MouseMoveEvent new setType: #mouseMove startPoint: position endPoint: position trail: {position. position} buttons: buttons hand: source stamp: Time eventMillisecondClock