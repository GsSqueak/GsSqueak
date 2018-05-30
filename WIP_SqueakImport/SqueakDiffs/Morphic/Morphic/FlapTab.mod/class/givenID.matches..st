as yet unclassified
givenID: aFlapID matches: pureID
	"eg, FlapTab givenID: 'Stack Tools2' matches: 'Stack Tools' "

	^ aFlapID = pureID or:
		[(aFlapID beginsWith: pureID)
			and: [(aFlapID copyFrom: pureID size+1 to: aFlapID size)
					allSatisfy: [:c | c isDigit]]]