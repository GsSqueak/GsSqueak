marker parsing
parseNextMarker
	"Parse the next marker of the stream"

	| byte discardedBytes |
	discardedBytes := 0.
	[(byte := self next) = 16rFF] whileFalse: [discardedBytes := discardedBytes + 1].	
	[[(byte := self next) = 16rFF] whileTrue. byte = 16r00] whileTrue:
		[discardedBytes := discardedBytes + 2].
	discardedBytes > 0 ifTrue: [self "notifyWithLabel: 'warning: extraneous data discarded'"].
	self perform:
		(JFIFMarkerParser
			at: byte
			ifAbsent:
				[(self okToIgnoreMarker: byte)
					ifTrue: [#skipMarker]
					ifFalse: [self error: 'marker ', byte printStringHex , ' cannot be handled']])