instance creation
detectFile: aBlockOrFileStream do: anotherBlock

	^aBlockOrFileStream value "Assume that FileStreams return self for #value."
		ifNotNil: [ :file | [ anotherBlock value: file ] ensure: [ file close ] ]