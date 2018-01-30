scanning
messagesSequence
	"Answer a Set of all the message selectors sent by this method."

	^Array streamContents:
		[:str| | scanner |
		scanner := InstructionStream on: self.
		scanner	scanFor: 
			[:x | | selectorOrSelf |
			(selectorOrSelf := scanner selectorToSendOrSelf) == scanner ifFalse:
				[str nextPut: selectorOrSelf].
			false	"keep scanning"]]