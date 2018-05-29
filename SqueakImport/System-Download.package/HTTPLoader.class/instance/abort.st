requests
abort
	| oldRequests |
	"Abort all requests"
	oldRequests := requests.
	requests := SharedQueue new.
	[oldRequests isEmpty] whileFalse: [
		oldRequests next signalAbort].
	downloads do: [:each | each ifNotNil: [each terminate]].
	downloads := OrderedCollection new
