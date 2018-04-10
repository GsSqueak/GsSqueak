playing commands
getFrameGraphic
	"Answer a form representing the receiver's costume's current graphic"
	^ self sendMessageToCostume: #getCurrentFrameForm