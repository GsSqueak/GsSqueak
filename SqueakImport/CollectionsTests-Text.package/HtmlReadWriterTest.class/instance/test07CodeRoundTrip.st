tests
test07CodeRoundTrip

	| textWithDoIt |
	textWithDoIt := self textWithDoIt.
	self assert: textWithDoIt equals: textWithDoIt printHtmlString asTextFromHtml
	