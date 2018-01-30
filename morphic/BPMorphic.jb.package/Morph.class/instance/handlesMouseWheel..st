event handling
handlesMouseWheel: evt 
	"Do I want to receive mouseWheel events? The default response is
	false, except if you have added sensitivity to mouseWheel events
	using the on:send:to: mechanism. Subclasses that implement these
	messages directly should override this one to return true."
	self eventHandler
		ifNotNil: [^ self eventHandler handlesMouseWheel: evt].
	^ false