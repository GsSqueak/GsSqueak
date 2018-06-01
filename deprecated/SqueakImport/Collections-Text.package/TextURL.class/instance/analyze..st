initialize-release
analyze: aString

	| list |
	list := super analyze: aString.

	(UIManager default request: 'URL to open' translated initialAnswer: (list at: 1))
		in: [:answer | answer ifEmpty: [url := list at: 1] ifNotEmpty: [url := answer]].
	
	^ list at: 2