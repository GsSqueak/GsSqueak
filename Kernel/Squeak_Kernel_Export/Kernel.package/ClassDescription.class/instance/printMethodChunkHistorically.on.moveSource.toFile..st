fileIn/Out
printMethodChunkHistorically: selector on: outStream moveSource: moveSource toFile: fileIndex
	"Copy all source codes historically for the method associated with selector onto the 
	 fileStream.  If moveSource is true, then also set the source code pointer of the method.
	 N.B. fileIndex is interpreted as follows, 0 => just a fileOut; 1 => condensing sources;
	 2 => condensing changes; therefore only changes on the chnages file before the last
	 version in the sources file are recorded."

	| preamble method newPos category changeList priorPos index |
	category := self organization categoryOfElement: selector.
	preamble := self name , ' methodsFor: ', category asString printString.
	method := self methodDict at: selector.
	(method filePosition = 0
	 or: [method fileIndex = 0
	 or: [(SourceFiles at: method fileIndex) isNil]])
		ifTrue: "no source; must decompile"
			[outStream cr; nextPut: $!; nextChunkPut: preamble; cr.
			outStream nextChunkPut: method decompileString.
			outStream nextChunkPut: ' '; cr]
		ifFalse:
			[changeList := ChangeSet directAncestryOfVersions: (ChangeSet
																	scanVersionsOf: method 
																	class: self 
																	meta: self isMeta
																	category: category 
																	selector: selector).
			newPos := priorPos := nil.
			(fileIndex = 2 "condensing changes; select changes file code and find last sources file change"
			 and: [(index := changeList findFirst: [:chgRec| chgRec fileIndex = 1]) > 0]) ifTrue:
				[priorPos := SourceFiles 
								sourcePointerFromFileIndex: 1
								andPosition: (changeList at: index) position.
				 changeList := changeList copyFrom: 1 to: index - 1].
			changeList reverseDo:
				[:chgRec|
				chgRec file closed ifTrue:
					[chgRec file reopen; setToEnd].
				outStream copyPreamble: preamble from: chgRec file at: chgRec position.
				priorPos ifNotNil:
					[outStream
						position: outStream position - 2;
						nextPutAll: ' prior: '; print: priorPos; nextPut: $!; cr].
				"Copy the method chunk"
				newPos := outStream position.
				outStream copyMethodChunkFrom: chgRec file at: chgRec position.
				chgRec file skipSeparators.      "The following chunk may have ]style["
				chgRec file peek == $] ifTrue:
					[outStream cr; copyMethodChunkFrom: chgRec file].
				outStream nextChunkPut: ' '; cr.
				chgRec position: newPos.
				priorPos := SourceFiles 
								sourcePointerFromFileIndex: fileIndex
								andPosition: newPos].
			moveSource ifTrue:
				[method setSourcePosition: newPos inFile: fileIndex]].
	^outStream