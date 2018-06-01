message functions
fileOutMessage
	"Put a description of the selected method on a file, or all methods if none selected."

	| fileName |
	self selectedMessageName ifNotNil:
		[^super fileOutMessage].
	fileName := UIManager default saveFilenameRequest: 'File out on which file?' initialAnswer: 'methods'.
	fileName isEmptyOrNil ifTrue: [^self].
	Cursor write showWhile:
		[| internalStream |
		internalStream := WriteStream on: (String new: 1000).
		internalStream header; timeStamp.
		messageList do:
			[:methodRef|
			methodRef methodSymbol == #Comment
				ifTrue:
					[methodRef actualClass organization
						putCommentOnFile: internalStream
						numbered: 1
						moveSource: false
						forClass: methodRef actualClass]
				ifFalse:
					[methodRef actualClass
						printMethodChunk: methodRef methodSymbol
						withPreamble: true
						on: internalStream
						moveSource: false
						toFile: nil]].
		FileStream writeSourceCodeFrom: internalStream baseName: fileName isSt: true useHtml: false]