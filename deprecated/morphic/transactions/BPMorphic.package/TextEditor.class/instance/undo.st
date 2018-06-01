menu messages
undo
	self closeTypeIn.
	self history undoIn: self.
	self history hasPrevious
		ifFalse: [morph hasUnacceptedEdits: false]