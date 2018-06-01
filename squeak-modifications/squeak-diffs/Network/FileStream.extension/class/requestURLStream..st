*network
requestURLStream: url
	"FileStream requestURLStream:'http://isgwww.cs.uni-magdeburg.de/~raab'"
	^self concreteStream new requestURLStream: url