private
resort: newMode 
	"Re-sort the list of files."
	| name |
	listIndex > 0 ifTrue: [ name := self fileNameFromFormattedItem: (list at: listIndex) ].
	sortMode := newMode.
	self pattern: pattern.
	name ifNotNil:
		[ fileName := name.
		listIndex := list findFirst:
			[ : item | (self fileNameFromFormattedItem: item) = name ].
		self
			 changed: #fileListIndex ;
			 changed: #labelString ].
	listIndex = 0 ifTrue: [ self changed: #contents ].
	self updateButtonRow