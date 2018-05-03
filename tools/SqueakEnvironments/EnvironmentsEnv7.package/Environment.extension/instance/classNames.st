*EnvironmentsEnv7-classes and traits
classNames
	^ (self allClasses
		collect: [:ea | ea name]) sort
