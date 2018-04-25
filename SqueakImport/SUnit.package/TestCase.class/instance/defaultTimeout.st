accessing
defaultTimeout
	"Answer the default timeout to use for tests in this test case.
	The timeout is a value in seconds."

	^Smalltalk isLowerPerformance ifTrue:[ 25] ifFalse: [5] "seconds"