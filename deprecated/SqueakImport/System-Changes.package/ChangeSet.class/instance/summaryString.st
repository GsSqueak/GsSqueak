fileIn/Out
summaryString
	"Answer the string summarizing this changeSet"

	^ self summaryStringDelta: 0
"
To summarize all recent changeSets on a file...
(FileStream newFileNamed: 'Summaries.txt') nextPutAll:
	(String streamContents:
		[:s | (ChangeSorter changeSetsNamedSuchThat:
			[:name | name first isDigit and: [name initialIntegerOrNil >= 948]])
			 do: [:cs | s nextPutAll: cs summaryString; cr]]);
		close

To list all changeSets with a certain string in the preamble...
	(FileStream newFileNamed: 'MyUpdates.txt') nextPutAll:
		(String streamContents:
			[:s | ChangeSorter gatherChangeSetRevertables do:
				[:cs | (cs preambleString notNil
					and: [cs preambleString includesSubString: 'Author Name'])
				 	ifTrue: [s nextPutAll: cs summaryString; cr]]]);
		close
"