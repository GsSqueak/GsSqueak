editing keys
pasteInitials: aKeyboardEvent 
	"Replace the current text selection by an authorship name/date
	stamp; invoked by cmd-shift-v, easy way to put an authorship stamp
	in the comments of an editor."
	self insertAndCloseTypeIn.
	self
		replace: self selectionInterval
		with: (Text fromString: Utilities changeStamp)
		and: [self selectAt: self stopIndex].
	^ true