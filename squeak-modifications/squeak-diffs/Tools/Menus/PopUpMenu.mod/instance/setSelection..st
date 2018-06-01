selecting
setSelection: index
	| newSelection |
	selection = index ifTrue: [^ self].
	newSelection := (0 max: index) min: frame height // marker height.
	selection > 0 ifTrue: [Display reverse: marker].
	marker := marker translateBy: 0 @ (newSelection - selection * marker height).
	selection := newSelection.
	selection > 0 ifTrue: [Display reverse: marker]