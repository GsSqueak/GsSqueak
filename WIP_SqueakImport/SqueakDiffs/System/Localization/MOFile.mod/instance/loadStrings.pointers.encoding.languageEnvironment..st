private
loadStrings: strm pointers: tupple encoding: encodingName languageEnvironment: env
	| strings rawStr str offsetTable lenTable |
	offsetTable :=  tupple first.
	lenTable := tupple second.
	strings := Array new: nStrings.
	1 to: nStrings do: [:index |
		rawStr := self loadString: strm 
					pointer:  (offsetTable at: index)
					length: (lenTable at: index).
		str := encodingName isNil ifTrue: [rawStr] 
						ifFalse: [ encodingName = 'utf8' 
									ifTrue: [rawStr utf8ToSqueak applyLanguageInformation: env]
									ifFalse: [self error: 'this encoding isn''t supported']
						].
		strings at: index put: str.
	].
	^strings.