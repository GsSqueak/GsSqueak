system simulation
copyBitsFrom: aBitBlt
	"Simulate the copyBits primitive"
	| proxy bb |
	proxy := InterpreterProxy new.
	self flag: #goodEnoughForNow.
	proxy loadStackFrom: thisContext sender. "actually: thisContext sender home"
	bb := self simulatorClass new.
	bb initialiseModule.
	bb setInterpreter: proxy.
	proxy success: (bb loadBitBltFrom: aBitBlt).
	bb primitiveCopyBits.
	^ proxy stackValue: 0
