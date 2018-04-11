commands
run: code environmentId: envId

	self setEnv: envId.
	^ self blockCommand: 'run' content: code