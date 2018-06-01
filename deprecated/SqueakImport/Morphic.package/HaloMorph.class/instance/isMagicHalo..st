accessing
isMagicHalo: aBool
	self setProperty: #isMagicHalo toValue: aBool.
	aBool
		ifTrue: [
			self on: #mouseEnter send: #handleEntered to: self.
			self on: #mouseLeave send: #handleLeft to: self]
		ifFalse:[
			"Reset everything"
			self eventHandler ifNotNil: [:eh |
				eh forgetDispatchesTo: #handleEntered;
					forgetDispatchesTo: #handleLeft].
			self stopStepping. "get rid of all"
			self startStepping. "only those of interest"].