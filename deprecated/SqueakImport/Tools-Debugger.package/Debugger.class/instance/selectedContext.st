private
selectedContext

	contextStackIndex = 0
		ifTrue: [^contextStack first]
		ifFalse: [^contextStack at: contextStackIndex]