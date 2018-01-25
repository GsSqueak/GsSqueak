printing
symbolicLinesDo: aBlock
	"Evaluate aBlock with each of the lines in the symbolic output."

	| aStream pc |
	aStream := (String new: 64) writeStream.
	self isQuick ifTrue:
		[self longPrintOn: aStream.
		 aBlock value: 0 value: aStream contents.
		 ^self].

	self primitive ~= 0 ifTrue:
		[self printPrimitiveOn: aStream.
		 aBlock value: 1 value: aStream contents.
		 aStream resetContents].

	pc := self initialPC.
	(InstructionPrinter on: self)
		indent: 0;
		printPC: false; "explorer provides pc anyway"
		printInstructionsOn: aStream
		do:	[:printer :scanner :stream| | line index |
			line := stream contents allButLast.
			(line includes: Character cr) ifTrue:
				[line := (line copyUpTo: Character cr), '...'' (continues)'].
			(index := line indexOf: $>) > 0 ifTrue:
				[[(line at: index + 1) isSeparator] whileTrue: [index := index + 1].
				 line := ((line copyFrom: 1 to: index) copyReplaceAll: (String with: Character tab) with: (String new: 8 withAll: Character space)),
						(line copyFrom: index + 1 to: line size)].
			aBlock value: pc value: line.
			pc := scanner pc.
			stream resetContents]