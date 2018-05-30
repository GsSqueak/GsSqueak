private
currentFrame
	frameList isEmpty ifTrue: [^nil].
     currentFrameIndex := currentFrameIndex min: (frameList size).
     currentFrameIndex := currentFrameIndex max: 1.
	^frameList at: currentFrameIndex