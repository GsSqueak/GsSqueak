*EnvironmentsEnv7-updating
binding: aBinding addedTo: anEnvironment 
	policies
		do: [:ea | ea
				binding: aBinding
				addedTo: anEnvironment
				notify: self]
