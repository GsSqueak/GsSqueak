closures
embeddedBlockClosures
	| bms extractor scanner endPC |
	bms := OrderedCollection new.
	scanner := self scanner.
	extractor := ClosureExtractor withAction: [ :c | bms add: c ] andScanner: scanner.
	endPC := self endPC.
	[ scanner pc <= endPC ] whileTrue: [ scanner interpretNextInstructionFor: extractor ].
	^ bms