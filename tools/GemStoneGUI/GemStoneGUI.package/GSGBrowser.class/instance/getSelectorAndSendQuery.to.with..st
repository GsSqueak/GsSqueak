misc
getSelectorAndSendQuery: querySelector to: queryPerformer with: queryArgs
	"Obtain a selector relevant to the current context, and then send the querySelector to the queryPerformer with the selector obtained and queryArgs as its arguments.  If no message is currently selected, then obtain a method name from a user type-in"

	| strm array |
	strm := WriteStream on: (array := Array new: queryArgs size + 1).
	strm nextPut: nil.
	strm nextPutAll: queryArgs.

	true ifTrue: [ | selector |
		selector := UIManager default request: 'Type selector:' initialAnswer: 'flag:'.
		selector := selector copyWithout: Character space.
		^ selector isEmptyOrNil ifFalse: [
				array at: 1 put: selector asSymbol.
				queryPerformer perform: querySelector withArguments: array]].

	self selectMessageAndEvaluate: [:selector |
		array at: 1 put: selector.
		queryPerformer perform: querySelector withArguments: array
	]