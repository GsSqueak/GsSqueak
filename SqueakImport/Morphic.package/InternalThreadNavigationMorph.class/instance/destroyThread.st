navigation
destroyThread
	"Manually destroy the thread"

	(self confirm: ('Destroy thread <{1}> ?' translated format:{threadName})) ifFalse: [^ self].
	self class knownThreads removeKey: threadName ifAbsent: [].
	self setProperty: #moribund toValue: true.  "In case pointed to in some other project"
	ActiveWorld keyboardNavigationHandler == self ifTrue:
		[self stopKeyboardNavigation]. 
	self delete