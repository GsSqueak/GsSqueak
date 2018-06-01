testing
shouldUsePluginAPI
	"HTTPClient shouldUsePluginAPI" 

	self isRunningInBrowser
		ifFalse: [^false].
	self browserSupportsAPI
		ifFalse: [^false].
	"The Mac plugin calls do not work in full screen mode"
	^((Smalltalk platformName = 'Mac OS')
		and: [DisplayScreen displayIsFullScreen]) not