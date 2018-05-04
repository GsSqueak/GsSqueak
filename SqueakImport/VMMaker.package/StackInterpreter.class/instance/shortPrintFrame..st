debug printing
shortPrintFrame: theFP
	<inline: false>
	<var: #theFP type: #'char *'>
	| rcvr |
	theFP = 0 ifTrue:
		[self print: 'null fp'; cr.
		 ^nil].
	rcvr := self frameReceiver: theFP.
	self printHexPtr: theFP.
	self space.
	self printActivationNameFor: (self frameMethod: theFP)
		receiver: rcvr
		isBlock: (self frameIsBlockActivation: theFP)
		firstTemporary: (self temporary: 0 in: theFP).
	self space.
	self shortPrintOop: rcvr "shortPrintOop: adds a cr"