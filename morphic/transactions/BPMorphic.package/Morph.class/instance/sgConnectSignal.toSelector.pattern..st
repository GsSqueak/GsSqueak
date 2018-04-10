-signals-morphic
sgConnectSignal: aSignal toSelector: aSelector pattern: aPattern 
	self
		sgConnectSignal: aSignal
		to: self
		selector: aSelector
		pattern: aPattern