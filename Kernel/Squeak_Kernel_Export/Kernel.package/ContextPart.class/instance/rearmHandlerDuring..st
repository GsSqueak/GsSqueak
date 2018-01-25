private-exceptions
rearmHandlerDuring: aBlock
	"Sent to handler (on:do:) contexts only. Makes me re-entrant for the duration of aBlock. Only works in a closure-enabled image"

	^ [self tempAt: 3 put: true. aBlock value]
		ensure: [self tempAt: 3 put: false]