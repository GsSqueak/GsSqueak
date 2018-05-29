*network
requestURLStream: url ifError: errorBlock
	"FileStream requestURLStream:'http://isgwww.cs.uni-magdeburg.de/~raab'"
	^self concreteStream new requestURLStream: url ifError: errorBlock