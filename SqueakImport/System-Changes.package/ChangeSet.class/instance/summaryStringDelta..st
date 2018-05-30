fileIn/Out
summaryStringDelta: delta
	"Answer the string summarizing this changeSet"
	
	^ String streamContents:
		[:s | | line author s2 ps intName date |
		intName := self name splitInteger.
		intName first isNumber
			ifTrue: [s nextPutAll: (intName first + delta) printString , intName last]
			ifFalse: [s nextPutAll: intName first  "weird convention of splitInteger"].
		(ps := self preambleString)
			ifNil: [s cr]
			ifNotNil:
			[s2 := ReadStream on: ps.
			s2 match: 'Date:'; skipSeparators.  date := s2 nextLine.
			s2 match: 'Author:'; skipSeparators.  author := s2 nextLine.
			s nextPutAll: ' -- '; nextPutAll: author; nextPutAll: ' -- '; nextPutAll: date; cr.
			[s2 atEnd] whileFalse:
				[line := s2 nextLine.
				(line isEmpty or: [line = '"']) ifFalse: [s nextPutAll: line; cr]]]].
