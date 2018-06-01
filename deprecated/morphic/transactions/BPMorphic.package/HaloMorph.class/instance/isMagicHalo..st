accessing
isMagicHalo: aBool 
	self setProperty: #isMagicHalo toValue: aBool.
	aBool
		ifFalse: ["Reset everything"
			self stopStepping.
			"get rid of all"
			self startStepping]