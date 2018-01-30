fileIn/Out
fileOutMethod: selector asHtml: useHtml
	"Write source code of a single method on a file in .st or .html format"

	| internalStream |
	(selector == #Comment) ifTrue: [^ self inform: 'Sorry, cannot file out class comment in isolation.'].
	(self includesSelector: selector) ifFalse: [^ self error: 'Selector ', selector asString, ' not found'].
	internalStream := WriteStream on: (String new: 1000).
	internalStream header; timeStamp.
	self printMethodChunk: selector withPreamble: true
		on: internalStream moveSource: false toFile: 0.

	FileStream writeSourceCodeFrom: internalStream baseName: (self name , '-' , (selector copyReplaceAll: ':' with: '')) isSt: true useHtml: useHtml.
