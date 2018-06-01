event handling
startDrag: evt

	self removeProperty: #waitingForTextDrag.

	[evt hand grabMorph: (TransferMorph withPassenger: self selection from: self)]
		ensure: [evt hand releaseMouseFocus: self].