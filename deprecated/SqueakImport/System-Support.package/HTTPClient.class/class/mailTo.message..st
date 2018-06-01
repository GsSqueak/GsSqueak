utilities
mailTo: address message: aString
	HTTPClient shouldUsePluginAPI
		ifFalse: [^self error: 'You need to run inside a web browser.'].
	FileStream post: aString url: 'mailto:' , address ifError: [self error: 'Can not send mail']