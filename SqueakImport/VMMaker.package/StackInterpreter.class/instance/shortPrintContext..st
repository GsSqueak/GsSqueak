debug printing
shortPrintContext: aContext
	| home |
	<inline: false>
	(self isContext: aContext) ifFalse:
		[self printHex: aContext; print: ' is not a context'; cr.
		^nil].
	home := self findHomeForContext: aContext.
	self printNum: aContext.
	(self isMarriedOrWidowedContext: aContext)
		ifTrue: [((self checkIsStillMarriedContext: aContext currentFP: framePointer)
				and: [self isMachineCodeFrame: (self frameOfMarriedContext: aContext)])
					ifTrue: [self print: ' m ']
					ifFalse: [self print: ' i ']]
		ifFalse: [self print: ' s '].
	self printActivationNameFor: (objectMemory fetchPointer: MethodIndex ofObject: home)
		receiver: (objectMemory fetchPointer: ReceiverIndex ofObject: home)
		isBlock: home ~= aContext
		firstTemporary: (objectMemory fetchPointer: 0 + CtxtTempFrameStart ofObject: home).
	self cr