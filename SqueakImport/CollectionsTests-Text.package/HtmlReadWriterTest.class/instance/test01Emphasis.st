tests
test01Emphasis

	{
		'<b>Hello, World!</b>'.
		'Hello, World!' asText addAttribute: TextEmphasis bold.
		
		'<b>Hello</b>, World!'.		
		'Hello, World!' asText addAttribute: TextEmphasis bold from: 1 to: 5.
	} pairsDo: [:expectedHtml :expectedText |
		
		self convertHtml: expectedHtml.
		self assert: expectedText string equals: text string.
		self assert: expectedText runs equals: text runs.
		
		self convertText: expectedText.
		self assert: expectedHtml equals: html].