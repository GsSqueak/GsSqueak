accessing
cursorWrapped: aNumber

	| sz |
	cursor ~= aNumber ifTrue: [
		cursor := aNumber.
		sz := data size.
		sz = 0
			ifTrue: [cursor := 1]
			ifFalse: [
				((cursor >= (sz + 1)) or: [cursor < 0]) ifTrue: [
					cursor := cursor - ((cursor // sz) * sz)].
				cursor < 1 ifTrue: [cursor := sz + cursor]].
		"assert: 1 <= cursor < data size + 1"
		hasChanged := true].
