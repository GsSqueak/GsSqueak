*SqKernel-evaluating
valueSupplyingAnswers: aListOfPairs
	"evaluate the block using a list of questions / answers that might be called upon to
	automatically respond to Object>>confirm: or FillInTheBlank requests"

	^self
		on: ProvideAnswerNotification
		do: [ :notification |
			| caption |
			caption := notification messageText withSeparatorsCompacted. "to remove new lines"
			aListOfPairs
				detect:  [ :each |
					caption = each first
						or: [ (caption includesSubstring: each first caseSensitive: false)
						or: [ (each first match: caption)
						or: [ (caption respondsTo: #matchesRegex:) 
							and: [ caption matchesRegex: each first ] ] ] ] ]
				ifFound: [ :answer | notification resume: answer second ]
				ifNone: [
					(ProvideAnswerNotification signal: notification messageText)
						ifNil: [ notification resume ]
						ifNotNil: [ :outerAnswer | notification resume: outerAnswer ] ] ]

