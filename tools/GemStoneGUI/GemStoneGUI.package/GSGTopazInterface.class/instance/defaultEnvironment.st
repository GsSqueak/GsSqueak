new api - environments
defaultEnvironment

	| topazOutput oopResult |
	self setEnv: 0.
	topazOutput := self run: (self codeForConvertingToOop: 'GsCurrentSession currentSession symbolList').
	oopResult := self convertToInteger: (topazOutput at: 1).
	^ self environmentProxyForOop: oopResult