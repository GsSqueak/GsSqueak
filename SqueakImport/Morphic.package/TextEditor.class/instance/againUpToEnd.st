menu messages
againUpToEnd
	"Find and replace until the end."
	
	| first |
	self again ifFalse: [^ self].

	first := self history previous.

	[self hasSelection] whileTrue: [
		self history previous
			isCompositeUndo: true;
			isCompositeRedo: true.
		self findReplaceAgainNow].

	first isCompositeUndo: false.
	
	self history previous isCompositeUndo: first ~~ self history previous.
	self history previous isCompositeRedo: false.