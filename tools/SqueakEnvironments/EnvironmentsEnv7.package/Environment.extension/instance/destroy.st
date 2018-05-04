*EnvironmentsEnv7-initialize-release
destroy
	self allClasses
		do: [:ea | ea removeFromSystem].
	declarations keys
		do: [:ea | self unbind: ea].
	policies
		do: [:ea | ea removeObserver: self].
	observers
		do: [:ea | ea stopObserving: self]
