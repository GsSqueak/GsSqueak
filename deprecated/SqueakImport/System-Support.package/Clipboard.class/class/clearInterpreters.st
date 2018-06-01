class initialization
clearInterpreters

	self allInstances do: [:each | each clearInterpreter].
