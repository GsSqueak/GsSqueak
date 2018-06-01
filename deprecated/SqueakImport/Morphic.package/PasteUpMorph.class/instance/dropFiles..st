event handling
dropFiles: anEvent
	"Handle a number of dropped files from the OS.
	TODO:
		- use a more general mechanism for figuring out what to do with the file (perhaps even offering a choice from a menu)
		- remember the resource location or (when in browser) even the actual file handle
	"
	| numFiles |
	numFiles := anEvent contents.
	1 to: numFiles do: [ :i |
		(FileDirectory requestDropDirectory: i) 
			ifNotNil: [:directory | self handleDroppedItem: directory event: anEvent]
			ifNil: [(FileStream requestDropStream: i) ifNotNil: [:stream |
				[self handleDroppedItem: stream event: anEvent] ensure: [stream close]]]].
				