post/get
requestURL: url target: target
	^self shouldUsePluginAPI
		ifTrue: [FileStream requestURL: url target: target]
		ifFalse: [self error: 'Requesting a new URL target is not supported.']