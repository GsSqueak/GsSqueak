file reader registration
itemsForDirectory: aFileDirectory 
	"Answer a list of services appropriate when no file is selected."
	| _gsSqueakTemp_services |
	_gsSqueakTemp_services := OrderedCollection new.
	self registeredFileReaderClasses
		do: [:reader | reader
				ifNotNil: [_gsSqueakTemp_services
						addAll: (reader fileReaderServicesForDirectory: aFileDirectory)]].
	^ _gsSqueakTemp_services