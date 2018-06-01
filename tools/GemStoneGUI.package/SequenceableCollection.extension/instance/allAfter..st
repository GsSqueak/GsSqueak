*GemStoneGUI
allAfter: target
	"Answer the element after target.  Answer an empty collection if target is not
	in the receiver, or if there are no elements after it."

	^ self allAfter: target ifAbsent: [self species new]