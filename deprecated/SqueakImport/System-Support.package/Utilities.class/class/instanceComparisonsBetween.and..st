miscellaneous
instanceComparisonsBetween: fileName1 and: fileName2
	"For differential results, run printSpaceAnalysis twice with different fileNames,
	then run this method...
		SpaceTally new printSpaceAnalysis: 0 on: 'STspace.text1'.
			--- do something that uses space here ---
		SpaceTally new printSpaceAnalysis: 0 on: 'STspace.text2'.
		Utilities instanceComparisonsBetween: 'STspace.text1' and: 'STspace.text2'"

	| instCountDict report f aString items className newInstCount oldInstCount newSpace oldPair oldSpace |
	instCountDict := Dictionary new.
	report := String new writeStream.
	f := FileStream readOnlyFileNamed: fileName1.
	[f atEnd] whileFalse:
		[aString := f nextLine.
		items := aString findTokens: ' '.
		(items size = 4 or: [items size = 5]) ifTrue:
			[instCountDict at: items first put: (Array with: items third asNumber with: items fourth asNumber)]].
	f close.

	f := FileStream readOnlyFileNamed: fileName2.
	[f atEnd] whileFalse:
		[aString := f nextLine.
		items := aString findTokens: ' '.
		(items size = 4 or: [items size = 5]) ifTrue:
			[className := items first.
			newInstCount := items third asNumber.
			newSpace := items fourth asNumber.
			oldPair := instCountDict at: className ifAbsent: [nil].
			oldInstCount := oldPair ifNil: [0] ifNotNil: [oldPair first].
			oldSpace := oldPair ifNil: [0] ifNotNil: [oldPair second].
			oldInstCount ~= newInstCount ifTrue:
				[report nextPutAll: (newInstCount - oldInstCount) printString; tab; nextPutAll: (newSpace - oldSpace) printString; tab; nextPutAll: className asString; cr]]].
	f close.

	(StringHolder new contents: report contents)
		openLabel: 'Instance count differentials between ', fileName1, ' and ', fileName2