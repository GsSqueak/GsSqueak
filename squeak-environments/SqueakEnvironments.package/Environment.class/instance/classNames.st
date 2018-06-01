classes and traits
classNames
	^ (self allClasses
		collect: [:ea | ea @env7: name]) sort
