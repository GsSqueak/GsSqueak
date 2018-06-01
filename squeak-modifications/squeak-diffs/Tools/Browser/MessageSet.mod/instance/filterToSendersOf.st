filtering
filterToSendersOf
	"Filter the receiver's list down to only those items which send a given selector"

	| aFragment inputWithBlanksTrimmed |

	aFragment := self request: 'type selector:' initialAnswer: ''.
	aFragment  isEmptyOrNil ifTrue: [^ self].
	inputWithBlanksTrimmed := aFragment withBlanksTrimmed.
	Symbol hasInterned: inputWithBlanksTrimmed ifTrue:
		[:aSymbol | 
			self filterFrom:
				[:aClass :aSelector | | aMethod |
					(aMethod := aClass compiledMethodAt: aSelector) notNil and:
						[aMethod hasLiteralThorough: aSymbol]]]

