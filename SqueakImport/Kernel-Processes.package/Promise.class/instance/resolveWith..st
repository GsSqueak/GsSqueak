resolving
resolveWith: arg
	"Resolve this promise. If arg is itself a Promise, make this promise depend upon it,
	as detailed in the Promises/A+ spec:
		https://promisesaplus.com/#the-promise-resolution-procedure"

	arg isPromise
		ifTrue: [
			arg whenResolved: [:v | self resolveWith: v].
			arg whenRejected: [:e | self rejectWith: e]]
		ifFalse: [
			mutex critical: [
				(state == #pending) ifTrue: [ | worklist |
					value := arg.
					state := #fulfilled.
					worklist := resolvers.
					resolvers = #().
					rejecters := #().
					worklist do: [:r | self evaluateResolver: r]]]]