private
resort: newMode 
	"Re-sort the list of files."
	| _gsSqueakTemp_name |
	listIndex > 0
		ifTrue: [_gsSqueakTemp_name := self
						fileNameFromFormattedItem: (list at: listIndex)].
	sortMode := newMode.
	self pattern: pattern.
	_gsSqueakTemp_name
		ifNotNil: [fileName := _gsSqueakTemp_name.
			listIndex := list
						findFirst: [:item | (self fileNameFromFormattedItem: item)
								= _gsSqueakTemp_name].
			self changed: #fileListIndex;
				 changed: #labelString].
	listIndex = 0
		ifTrue: [self changed: #contents].
	self updateButtonRow