post/get
httpGetDocument: url
	| stream content | 
	^self shouldUsePluginAPI
		ifTrue: [
			stream := FileStream requestURLStream: url ifError: [self error: 'Error in get from ' , url printString].
			stream ifNil: [^''].
			stream position: 0.
			content := stream upToEnd.
			stream close.
			MIMEDocument content: content]
		ifFalse: [HTTPSocket httpGetDocument: url]