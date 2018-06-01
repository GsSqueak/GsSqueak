filtering
filterToNotImplementorsOf
	"Filter the receiver's list down to only those items whose selector is NOT one solicited from the user."

	| aFragment inputWithBlanksTrimmed |

	aFragment := self request: 'type selector: ' initialAnswer: ''.
	aFragment  isEmptyOrNil ifTrue: [^ self].
	inputWithBlanksTrimmed := aFragment withBlanksTrimmed.
	Symbol hasInterned: inputWithBlanksTrimmed ifTrue:
		[:aSymbol | 
			self filterFrom:
				[:aClass :aSelector |
					aSelector ~~ aSymbol]]