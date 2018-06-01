resolving
rejectWith: anObject
	"Reject this promise."
	mutex critical: [
		(state == #pending) ifTrue: [ | worklist |
			error := anObject.
			state := #rejected.
			worklist := rejecters.
			resolvers := #().
			rejecters := #().
			worklist do: [:r | self evaluateRejecter: r]]]