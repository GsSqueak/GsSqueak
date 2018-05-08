tests
test04LineBreaks

	{
		'Hello, World!<br>
'.
		'Hello, World!
' asText.

		'Hello, <b>World!<br>
</b>'.
		'Hello, World!
' asText
			addAttribute: TextEmphasis bold from: 8 to: 14.
	} pairsDo: [:expectedHtml :expectedText |
		
		self convertHtml: expectedHtml.
		self assert: expectedText string equals: text string.
		self assert: expectedText runs equals: text runs.
		
		self convertText: expectedText.
		self assert: expectedHtml equals: html.
		
		self convertHtml: html.
		self convertText: text.
		self assert: expectedHtml equals: html.
		
		
		].