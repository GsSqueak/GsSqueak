file reader registration
registerFileReader: aProviderClass 
	"register the given class as providing services for reading files"
	| _gsSqueakTemp_registeredReaders |
	_gsSqueakTemp_registeredReaders := self registeredFileReaderClasses.
	(_gsSqueakTemp_registeredReaders includes: aProviderClass)
		ifFalse: [_gsSqueakTemp_registeredReaders addLast: aProviderClass]