monad
then: resolvedBlock ifRejected: errBlock
	"Return a Promise that, if it resolves, runs the resolvedBlock. If resolution throws an Exception, it runs the errBlock."
	| p |
	p := Promise new.
	self whenResolved: [:v |
		[p resolveWith: (resolvedBlock value: v)]
			on: Error do: [:e | p rejectWith: e]].
	self whenRejected: [:e | p rejectWith: (errBlock value: e)].
	^ p.