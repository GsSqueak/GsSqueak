primitives
primitiveCopyBits
	"Invoke the copyBits primitive. If the destination is the display, then
	copy it to the screen."
	| _gsSqueakTemp_rcvr |
	<export: true>
	_gsSqueakTemp_rcvr := interpreterProxy stackValue: interpreterProxy methodArgumentCount.
	(self loadBitBltFrom: _gsSqueakTemp_rcvr)
		ifFalse: [^ interpreterProxy primitiveFail].
	self copyBits.
	interpreterProxy failed
		ifTrue: [^ nil].
	self showDisplayBits.
	interpreterProxy failed
		ifTrue: [^ nil].
	interpreterProxy pop: interpreterProxy methodArgumentCount.
	combinationRule = 22 | (combinationRule = 32)
		ifTrue: [interpreterProxy pop: 1.
			^ interpreterProxy pushInteger: bitCount]