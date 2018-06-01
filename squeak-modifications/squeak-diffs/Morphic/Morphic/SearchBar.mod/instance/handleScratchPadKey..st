private
handleScratchPadKey: aKeyboardEvent 
	(aKeyboardEvent keyValue = Character escape asciiValue and: [ originatingWidget notNil ]) ifTrue:
		[ aKeyboardEvent hand newKeyboardFocus: originatingWidget.
		self removeScratchPad ]