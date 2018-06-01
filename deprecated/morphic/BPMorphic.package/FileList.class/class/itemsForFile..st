file reader registration
itemsForFile: fullName 
	"Answer a list of services appropriate for a file of the given full name"
	| _gsSqueakTemp_services _gsSqueakTemp_suffix |
	_gsSqueakTemp_suffix := self suffixOf: fullName.
	_gsSqueakTemp_services := OrderedCollection new.
	self registeredFileReaderClasses
		do: [:reader | reader
				ifNotNil: [_gsSqueakTemp_services
						addAll: (reader fileReaderServicesForFile: fullName suffix: _gsSqueakTemp_suffix)]].
	^ _gsSqueakTemp_services