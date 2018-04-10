accessing
allRegisteredServices
	"self allRegisteredServices"
	| _gsSqueakTemp_col |
	_gsSqueakTemp_col := OrderedCollection new.
	self registeredFileReaderClasses
		do: [:each | _gsSqueakTemp_col addAll: each services].
	^ _gsSqueakTemp_col