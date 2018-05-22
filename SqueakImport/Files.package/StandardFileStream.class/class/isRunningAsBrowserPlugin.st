browser requests
isRunningAsBrowserPlugin
	self new waitBrowserReadyFor: 1000 ifFail: [^false].
	^true