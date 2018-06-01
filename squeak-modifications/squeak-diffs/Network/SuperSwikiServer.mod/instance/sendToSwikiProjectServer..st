for real
sendToSwikiProjectServer: anArray

	| argsDict answer buildStream |

	buildStream := WriteStream on: String new.
	anArray do: [ :each | 
		buildStream 
			nextPutAll: each size printString;
			space;
			nextPutAll: each
	].
	(argsDict := Dictionary new)
		at: 'swikicommands'
		put: {buildStream contents}.
	answer := HTTPSocket 
		httpPostToSuperSwiki: self url
		args: argsDict
		accept: 'application/octet-stream' 
		request: ''.
	^(answer isKindOf: MIMEDocument) ifTrue: [answer content] ifFalse: [answer]
