e-toy support
cursor: aNumber

	| truncP |
	cursor ~= aNumber ifTrue:  [
		cursor := aNumber.
		truncP := aNumber truncated.
		truncP > data size ifTrue: [cursor := data size].
		truncP < 0 ifTrue: [cursor := 1].
		self keepIndexInView: truncP.
		hasChanged := true].
