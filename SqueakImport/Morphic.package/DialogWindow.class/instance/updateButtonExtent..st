updating
updateButtonExtent: margin

	"Update all button extents."
	(buttonRow submorphs collect: [:ea | ea minimumExtent]) max + margin in: [:preferredExtent |
		buttonRow submorphsDo: [:ea | ea extent: preferredExtent]].
	
	"See if horizontal button layout would be more appropriate."
	self flag: #magicNumber. "mt: Remove number with computation, maybe choose button font and 20 characters"
	(buttonRow submorphs collect: [:ea | ea fullBounds width]) sum > 400
		ifTrue: [buttonRow
					hResizing: #shrinkWrap;
					listDirection: #topToBottom;
					layoutInset: (buttonRow owner fullBounds width - (buttonRow owner layoutInset left*2) - buttonRow submorphs first fullBounds width // 2@0)]
		ifFalse: [buttonRow
					hResizing: #spaceFill;
					listDirection: #leftToRight;
					layoutInset: 0].