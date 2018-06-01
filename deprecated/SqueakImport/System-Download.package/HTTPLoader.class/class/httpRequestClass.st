accessing
httpRequestClass
	^HTTPClient shouldUsePluginAPI
		ifTrue: [PluginHTTPDownloadRequest]
		ifFalse: [HTTPDownloadRequest]