initialize-release
receiver: rcvr selector: selName arguments: args precedence: p from: encoder sourceRange: range 
	"Compile."
	(selName == #future
			or: [selName == #future:])
		ifTrue: [^ SqFutureNode new
				receiver: rcvr
				selector: selName
				arguments: args
				precedence: p
				from: encoder
				sourceRange: range].
	(rcvr isFutureNode
			and: [rcvr futureSelector == nil])
		ifTrue: ["Transform regular message into future"
			^ rcvr
				futureMessage: selName
				arguments: args
				from: encoder
				sourceRange: range].
	encoder noteSourceRange: range forNode: self.
	^ self
		receiver: rcvr
		selector: selName
		arguments: args
		precedence: p
		from: encoder