writing
writeChars255: anInteger atMax: aNumber

	(aNumber between: 1 and: 4) ifFalse: [^ self error: 'Unexpected byte count'].
	4 to: (5 - aNumber) by: -1 do:
		[:index | self dataStream nextPut: (anInteger digitAt: index) asCharacter].
