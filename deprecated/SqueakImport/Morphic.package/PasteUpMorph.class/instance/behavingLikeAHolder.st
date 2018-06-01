options
behavingLikeAHolder
	"Answer whether the receiver is currently behaving like a Holder"

	^ self resizeToFit and: [self indicateCursor and: [self autoLineLayout]]