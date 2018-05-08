tests
test03FontTag

	{
		'<font color="#FFFF00">Hello, World!</font>'.
		'Hello, World!' asText
			addAttribute: (TextColor color: Color yellow).
	} pairsDo: [:expectedHtml :expectedText |
		
		self convertHtml: expectedHtml.
		self assert: expectedText string equals: text string.
		self assert: expectedText runs equals: text runs.
		
		self convertText: expectedText.
		self assert: expectedHtml equals: html].