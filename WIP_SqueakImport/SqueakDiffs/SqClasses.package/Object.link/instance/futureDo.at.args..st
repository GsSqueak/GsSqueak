*SqClasses-futures
futureDo: aSelector at: deltaMSecs args: args
	"Send a message deltaMSecs into the future (some implementations may requires 'deltaMSecs' to be zero).  No response is expected.  See comment in class FutureNode."
	Project current future: self do: aSelector at: deltaMSecs args: args.
	^nil
