registration
register: aProviderClass
	(self registeredClasses includes: aProviderClass) ifFalse:
		[default := nil.  "so it'll ask for a new default, since if you're registering a new app you probably want to use it"
		self registeredClasses add: aProviderClass].