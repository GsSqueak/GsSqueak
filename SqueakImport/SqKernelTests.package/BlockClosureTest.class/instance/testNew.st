tests
testNew
	self should: [Context new: 5] raise: Error.
	[Context new: 5]
		on: Error do: [:e|
			self assert: (e messageText includesSubstring: 'newForMethod:') description: 'Error doesn''t tell you what you did wrong by calling #new:'].

	self should: [Context new] raise: Error.
	[Context new]
		on: Error do: [:e|
			self assert: (e messageText includesSubstring: 'newForMethod:') description: 'Error doesn''t tell you what you did wrong by calling #new']