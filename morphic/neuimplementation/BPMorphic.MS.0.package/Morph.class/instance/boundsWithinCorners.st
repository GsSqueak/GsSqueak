drawing
boundsWithinCorners
	"Return a single sub-rectangle that lies entirely inside corners
	that are made by me.
	Used to identify large regions of window that do not need to be
	redrawn. "
	^ self wantsRoundedCorners
		ifTrue: [self bounds insetBy: 0 @ self cornerRadius]
		ifFalse: [self bounds]