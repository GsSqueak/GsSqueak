*EnvironmentsEnv7-updating
binding: aBinding removedFrom: anEnvironment 
	policies
		do: [:ea | ea
				binding: aBinding
				removedFrom: anEnvironment
				notify: self]
