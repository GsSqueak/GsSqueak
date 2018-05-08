tests
test05Escaping

	{
		'<b>Morph&gt;&gt;#drawOn:</b>'.
		'Morph>>#drawOn:' asText addAttribute: TextEmphasis bold.
	} pairsDo: [:expectedHtml :expectedText |
		
		self convertHtml: expectedHtml.
		self assert: expectedText string equals: text string.
		self assert: expectedText runs equals: text runs.
		
		self convertText: expectedText.
		self assert: expectedHtml equals: html].