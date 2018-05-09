private
installEventTickler
	"Initialize the interrupt watcher process. Terminate the old process if any."
	"Sensor installEventTickler"

	EventTicklerProcess ifNotNil: [EventTicklerProcess terminate].
	EventTicklerProcess := [self eventTickler] forkAt: Processor lowIOPriority.
