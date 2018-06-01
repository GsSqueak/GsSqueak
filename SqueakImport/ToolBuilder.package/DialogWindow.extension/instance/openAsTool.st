*ToolBuilder-Morphic-opening
openAsTool

	self flag: #fishy. "mt: Why does the dialog not return its Morphic form but data?"
	^ self
		moveToHand;
		getUserResponse