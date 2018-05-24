fileout
fileoutMethods: aCollection to: aFolderName

	self assureEmptyMethodFolder: aFolderName.
	aCollection ifNil: [^ self].
	aCollection do: [ :method |
		self save: aFolderName , $/ , method fileDescriptor
			 contents: method category , Character cr , method source]