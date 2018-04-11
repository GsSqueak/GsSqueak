playing commands
getTotalFrames
	"Answer the receiver's costume's totalFrames. Applies to
	MPEGMoviePlayerMorphs "
	^ self sendMessageToCostume: #totalFrames