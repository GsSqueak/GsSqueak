tests
test12AlignmentMixed

	{
		'<center>Hello, <i>World!</i></center>'.
		'Hello, World!' asText
			addAttribute: TextAlignment centered;
			addAttribute: TextEmphasis italic from: 8 to: 13.
	} pairsDo: [:expectedHtml :expectedText |
		
		self convertHtml: expectedHtml.
		self assert: expectedText string equals: text string.
		self assert: expectedText runs equals: text runs.
		
		self convertText: expectedText.
		self assert: expectedHtml equals: html].