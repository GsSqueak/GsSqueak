tests
test02Mixed
	"At the moment, the html code generation is kind of verbose..."
	
	{
		'<b>Hello, </b><b><i>World!</i></b>!'.
		'Hello, World!!' asText
			addAttribute: TextEmphasis bold from: 1 to: 13;
			addAttribute: TextEmphasis italic from: 8 to: 13.
	} pairsDo: [:expectedHtml :expectedText |
		
		self convertHtml: expectedHtml.
		self assert: expectedText string equals: text string.
		self assert: expectedText runs equals: text runs.
		
		self convertText: expectedText.
		self assert: expectedHtml equals: html].