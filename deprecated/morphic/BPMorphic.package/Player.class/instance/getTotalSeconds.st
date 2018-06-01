playing commands
getTotalSeconds
	"Answer the total number of seconds in the receiver's costume,
	typically a movie"
	^ self sendMessageToCostume: #totalSeconds