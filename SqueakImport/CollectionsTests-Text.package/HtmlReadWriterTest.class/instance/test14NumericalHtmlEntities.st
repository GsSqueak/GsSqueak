tests
test14NumericalHtmlEntities

	{
		'&#46;&#x00021;'.
		'.!' asText.
	} pairsDo: [:expectedHtml :expectedText |
		
		self convertHtml: expectedHtml.
		self assert: expectedText string equals: text string]