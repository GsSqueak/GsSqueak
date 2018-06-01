fileout
assureFileDirectoryIn: aFileDirectory

	| directory |
	directory := self fileDirectory ifNil: [
					| extension |
					extension := self class defaultExtension ifNotEmpty: [:ext | '.' , ext].
					aFileDirectory directoryNamed: (self name , extension)].
	directory assureExistence.
	fileDirectory := directory