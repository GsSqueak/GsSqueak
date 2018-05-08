tests
test09StruckOut

	{
		'<s>Hello, World!</s>'.
		'Hello, World!' asText addAttribute: TextEmphasis struckOut.
		
		'<s>Hello</s>, World!'.		
		'Hello, World!' asText addAttribute: TextEmphasis struckOut from: 1 to: 5.
	} pairsDo: [:expectedHtml :expectedText |
		
		self convertHtml: expectedHtml.
		self assert: expectedText string equals: text string.
		self assert: expectedText runs equals: text runs.
		
		self convertText: expectedText.
		self assert: expectedHtml equals: html].