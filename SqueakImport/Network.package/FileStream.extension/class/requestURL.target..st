*network
requestURL: url target: target
	"FileStream requestURL:'http://isgwww.cs.uni-magdeburg.de/~raab' target: ':=blank' "
	^self concreteStream new requestURL: url target: target