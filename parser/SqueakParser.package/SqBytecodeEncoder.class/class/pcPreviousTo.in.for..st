bytecode decoding
pcPreviousTo: thePC in: method for: anInstructionStreamOrContext 
	"Answer the pc of the bytecode before the bytecode at thePC.
	Unlike CompiledMethod>>pcPreviousTo:, this version answers nil for
	the first bytecode of an embedded block, and answers the pc of the
	block creation bytecode for a bytecode following an embedded block."
	| pc nextPc prevPc byte createClosureCode |
	thePC > method endPC
		ifTrue: [^ method endPC].
	pc := method initialPC.
	"We could save time by scanning from the block creation bytecode of
	an embedded block,
	using the following, but it saves less time than it loses in additional
	tests."
	"(anInstructionStreamOrContext isContext
	and: [anInstructionStreamOrContext isClosureContext
	and: [(nextPc := anInstructionStreamOrContext startpc) > pc]])
	ifTrue: [pc := self pcOfBlockCreationBytecodeForBlockStartingAt:
	nextPc in: method]."
	createClosureCode := self createClosureCode.
	[pc < thePC]
		whileTrue: [byte := method at: (prevPc := pc).
			[pc := createClosureCode == byte
						ifTrue: [nextPc := self pcFollowingBlockAt: pc in: method.
							nextPc = thePC
								ifTrue: ["first bytecode following block"
									^ prevPc"Here's code to measure the effect of
									short-cutting scanning for blocks
									by starting at the startpc.
									It measures how much time is used to
									scan for the pcs from the last
									block to the end of all mwetods
									containing blocks. Uncomment out
									the short-cut above to compare time
									with the optimization and time
									without. I see approximately 290ms
									for all such methods with the
									optimization and 292 ms without, so
									given that this slows down the
									substantial majority of methods
									without blocks, we KISS."
									"| candidates |
									candidates := Dictionary new.
									self systemNavigation allSelect:
									[:m| | ebc |
									(m isQuick or: [(ebc := m
									embeddedBlockClosures) isEmpty])
									ifFalse: [candidates at: m put: { ebc
									last. Array streamContents:
									[:s| | is |
									(is:= InstructionStream on: m)
									pc: ebc last startpc;
									scanFor:
									[:b|
									s nextPut: is pc.
									false]] }].
									false].
									(1 to: 10) collect:
									[:ign|
									{ [candidates keysAndValuesDo:
									[:m :tuple|
									[:ebc :pcs| | c |
									c := ebc outerContext.
									pcs do:
									[:pc| m encoderClass pcPreviousTo: pc
									in: m for: c]]
									valueWithArguments: tuple]]
									timeToRun. [candidates
									keysAndValuesDo: [:m :tuple|
									[:ebc :pcs| | c |
									c := ebc outerContext.
									pcs do:
									[:pc| m encoderClass pcPreviousTo: pc
									in: m for: nil]]
									valueWithArguments: tuple]]
									timeToRun. }]"].
							nextPc > thePC
								ifTrue: [pc
											+ (self bytecodeSize: byte) = thePC
										ifTrue: ["first bytecode of block"
											^ nil].
									pc
										+ (self bytecodeSize: byte)]
								ifFalse: [nextPc]]
						ifFalse: [pc
								+ (self bytecodeSize: byte)].
			self isExtension: byte]
				whileTrue: [byte := method at: pc]].
	^ prevPc"Here's code to measure the effect of short-cutting scanning for blocks
	by starting at the startpc.
	It measures how much time is used to scan for the pcs from the last
	block to the end of all mwetods containing blocks. Uncomment out
	the short-cut above to compare time with the optimization and time
	without. I see approximately 290ms for all such methods with the
	optimization and 292 ms without, so given that this slows down the
	substantial majority of methods without blocks, we KISS."
	"| candidates |
	candidates := Dictionary new.
	self systemNavigation allSelect:
	[:m| | ebc |
	(m isQuick or: [(ebc := m embeddedBlockClosures) isEmpty]) ifFalse:
	[candidates at: m put: { ebc last.
	Array streamContents:
	[:s| | is |
	(is:= InstructionStream on: m)
	pc: ebc last startpc;
	scanFor:
	[:b|
	s nextPut: is pc.
	false]] }].
	false].
	(1 to: 10) collect:
	[:ign|
	{ [candidates keysAndValuesDo:
	[:m :tuple|
	[:ebc :pcs| | c |
	c := ebc outerContext.
	pcs do:
	[:pc| m encoderClass pcPreviousTo: pc in: m for: c]]
	valueWithArguments: tuple]] timeToRun.
	[candidates keysAndValuesDo:
	[:m :tuple|
	[:ebc :pcs| | c |
	c := ebc outerContext.
	pcs do:
	[:pc| m encoderClass pcPreviousTo: pc in: m for: nil]]
	valueWithArguments: tuple]] timeToRun. }]"