initialization
clearInterpreters

	self allInstances do: [:each | each clearKeyboardInterpreter].
