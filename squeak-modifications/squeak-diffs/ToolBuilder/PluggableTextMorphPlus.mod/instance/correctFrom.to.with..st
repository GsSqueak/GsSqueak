styling
correctFrom: start to: stop with: aString
	"see the comment in #acceptTextInModel "
	unstyledAcceptText ifNotNil:[unstyledAcceptText replaceFrom: start to: stop with: aString ].
	^ super correctFrom: start to: stop with: aString