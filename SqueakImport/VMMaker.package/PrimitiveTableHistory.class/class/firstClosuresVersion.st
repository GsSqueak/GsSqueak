significant versions
firstClosuresVersion
	"The primitive table corresponding to the first closures enabled image"

	"self firstClosuresVersion"
	"self differenceFrom: self lastPreClosuresVersion to: self firstClosuresVersion"
	"self differenceFrom: self firstClosuresVersion to: self latestForInterpreterVM"

	^self table20090218