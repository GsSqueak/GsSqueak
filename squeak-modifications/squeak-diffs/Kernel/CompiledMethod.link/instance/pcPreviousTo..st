scanning
pcPreviousTo: thePC
	"Answer the pc of the bytecode before the bytecode at thePC."
	| pc prevPc byte encoderClass |
	thePC > self endPC ifTrue: [^self endPC].
	pc := self initialPC.
	encoderClass := self encoderClass.
	[pc < thePC] whileTrue:
		[byte := self at: (prevPc := pc).
		 [pc := pc + (encoderClass bytecodeSize: byte).
		  encoderClass isExtension: byte] whileTrue:
			[byte := self at: pc]].
	^prevPc