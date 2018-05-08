tests
test06Comments

	| expectedText |
	expectedText := 'Hello & World!' asText
		addAttribute: TextEmphasis bold.
		
	self convertHtml: '
<!-- This is <> JUST! &&;; a COMMENT! -->
<b>Hello &amp; World!</b>'.

	self assert: expectedText string equals: text string.
	self assert: expectedText runs equals: text runs.