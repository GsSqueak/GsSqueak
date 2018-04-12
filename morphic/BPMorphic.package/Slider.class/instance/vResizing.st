as yet unclassified
vResizing
	"Due to possible automatic orientation change on extent changes, we
	have to calculate the resizing property based on the current
	orientation. Otherwise, layout will break. There is, however, support
	for using the resizing property in layout properties if set."
	self layoutProperties
		ifNotNil: [:props | ^ props vResizing].
	^ self orientation == #vertical
		ifTrue: [#spaceFill]
		ifFalse: [#rigid]