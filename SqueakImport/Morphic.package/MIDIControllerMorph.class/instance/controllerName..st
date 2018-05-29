menu
controllerName: controllerNumber
	"Answer a name for the given controller. If no name is available, use the form 'CC5' (CC is short for 'continuous controller')."

	self controllerList do: [:pair |
		pair first = controllerNumber ifTrue: [^ pair last]].
	^ 'CC', controllerNumber asString
