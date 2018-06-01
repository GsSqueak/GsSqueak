-signals-morphic
sgConnectSignal: aSignal toSelector: aSelector 
	self
		sgConnectSignal: aSignal
		to: self
		selector: aSelector
		pattern: nil