tests
test15NestedTagsStillEndBefore

	{
		'<span><i>Hallo</i> welt</span>'.
		'Hallo welt' asText
			addAttribute: TextEmphasis italic from: 1 to: 5.
	} pairsDo: [:expectedHtml :expectedText |
		self convertHtml: expectedHtml.
		self assert: expectedText string equals: text string.
		self assert: expectedText runs equals: text runs]