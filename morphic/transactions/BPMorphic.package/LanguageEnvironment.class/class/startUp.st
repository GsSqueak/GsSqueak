class initialization
startUp
	self clearDefault.
	self environment
		at: #HandMorph
		ifPresent: [:hm | hm startUp].
	self environment
		at: #Clipboard
		ifPresent: [:cp | cp startUp]