selecting
accept: aString 
	| result |
	result := self doItReceiver class evaluatorClass new
				evaluate: (ReadStream on: aString)
				in: self doItContext
				to: self doItReceiver
				notifying: nil  "fix this"
				ifFail: [self changed: #flash.
					^ false].
	self replaceSelectionValue: result.
	self changed: #contents.
	^ true