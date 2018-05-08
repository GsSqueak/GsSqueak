tests
test11Alignment

	{
	"	'<center>Hello, World!</center>'.
		'Hello, World!' asText addAttribute: TextAlignment centered.
"
		'<div align=left>Hello, World!</div>'.
		'Hello, World!' asText addAttribute: TextAlignment leftFlush.

		'<div align=right>Hello, World!</div>'.
		'Hello, World!' asText addAttribute: TextAlignment rightFlush.

		'<div align=justify>Hello, World!</div>'.
		'Hello, World!' asText addAttribute: TextAlignment justified.
	} pairsDo: [:expectedHtml :expectedText |
		
		self convertHtml: expectedHtml.
		self assert: expectedText string equals: text string.
		self assert: expectedText runs equals: text runs.
		
		self convertText: expectedText.
		self assert: expectedHtml equals: html].