selecting
selectionPrintString
	| text |
	selectionUpdateTime := [text := [self selection isInteger
										ifTrue: [self selection storeStringBase: self defaultIntegerBase]
										ifFalse: [self selection printStringLimitedTo: 5000]]
						on: Error
						do: [text := self printStringErrorText.
							text
								addAttribute: TextColor red
								from: 1
								to: text size.
							text]] timeToRun.
	^ text