post/get
httpPostMultipart: url args: argsDict
	" do multipart/form-data encoding rather than x-www-urlencoded "

	^self shouldUsePluginAPI
		ifTrue: [self pluginHttpPostMultipart: url args: argsDict]
		ifFalse: [HTTPSocket httpPostMultipart: url args: argsDict accept: nil request: '']