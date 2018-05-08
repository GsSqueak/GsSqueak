tests
test13SpanTag

	{
		'<span style="width: 100px;color:#FFFF00; font-style: bold; font-size: 10px">Hello, World!</span>'.
		'Hello, World!' asText
			addAttribute: (TextColor color: Color yellow);
			addAttribute: (TextEmphasis bold).
	} pairsDo: [:expectedHtml :expectedText |
		
		self convertHtml: expectedHtml.
		self assert: expectedText string equals: text string.
		self assert: expectedText runs equals: text runs]