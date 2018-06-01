utility
trimProperty: aSymbol

	| loadedValue originalValue key |
	loadedValue := self perform: ('loaded' , aSymbol) asSymbol.
	originalValue := self perform: ('original' , aSymbol) asSymbol.
	key := self perform: ('keyFor' , aSymbol) asSymbol.
	(loadedValue notNil and: [loadedValue = originalValue]) ifTrue: [
		self properties removeKey: key]