contents
newTextContents: stringOrText
	"Accept new text contents."

	| newText myText |
	"Just underway; trying to make this work like TextMorph does, but not quite there yet."

	newText := stringOrText asText.
	(myText := textMorph text) = newText ifTrue: [^ self].  "No substantive change"
	
	self world ifNotNil:
		[self world startSteppingSubmorphsOf: self ].
