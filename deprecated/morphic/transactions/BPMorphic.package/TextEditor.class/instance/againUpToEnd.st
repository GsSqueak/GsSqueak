menu messages
againUpToEnd
	"Find and replace until the end."
	| _gsSqueakTemp_first |
	self again
		ifFalse: [^ self].
	_gsSqueakTemp_first := self history previous.
	[self hasSelection]
		whileTrue: [self history previous isCompositeUndo: true;
				 isCompositeRedo: true.
			self findReplaceAgainNow].
	_gsSqueakTemp_first isCompositeUndo: false.
	self history previous isCompositeUndo: _gsSqueakTemp_first ~~ self history previous.
	self history previous isCompositeRedo: false