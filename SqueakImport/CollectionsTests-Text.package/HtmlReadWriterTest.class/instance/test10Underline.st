tests
test10Underline

	{
		'<u>Hello, World!</u>'.
		'Hello, World!' asText addAttribute: TextEmphasis underlined.
		
		'<u>Hello</u>, World!'.		
		'Hello, World!' asText addAttribute: TextEmphasis underlined from: 1 to: 5.
	} pairsDo: [:expectedHtml :expectedText |
		
		self convertHtml: expectedHtml.
		self assert: expectedText string equals: text string.
		self assert: expectedText runs equals: text runs.
		
		self convertText: expectedText.
		self assert: expectedHtml equals: html].