error handling
doesNotUnderstand: aMessage
	(self includesSelector: aMessage selector) ifTrue:
		[^self default perform: aMessage selector withArguments: aMessage arguments].
	^super doesNotUnderstand: aMessage