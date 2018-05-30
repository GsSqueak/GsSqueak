meta-actions
makeMultipleSiblings: evt
	"Make multiple siblings, first prompting the user for how many"

	| result |
	self topRendererOrSelf couldMakeSibling ifFalse: [^ Beeper beep].
	result := UIManager default request: 'how many siblings do you want?' translated initialAnswer: '2'.
	result isEmptyOrNil ifTrue: [^ self].
	result first isDigit ifFalse: [^ Beeper beep].
	self topRendererOrSelf makeSiblings: result asInteger.