-widgets-events-testing
hasSubmorphKeyboard
	^ self submorphs
		anySatisfy: [:morph | morph hasAnyKeyboard]