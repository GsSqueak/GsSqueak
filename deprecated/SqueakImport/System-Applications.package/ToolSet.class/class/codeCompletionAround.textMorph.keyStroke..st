completion
codeCompletionAround: aBlock textMorph: aTextMorph keyStroke: evt
	self default ifNil: [aBlock value. ^ self].
	self default codeCompletionAround: aBlock textMorph: aTextMorph keyStroke: evt