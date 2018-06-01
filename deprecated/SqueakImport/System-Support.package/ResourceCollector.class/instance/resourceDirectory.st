accessing
resourceDirectory
	resourceDirectory ifNil: [resourceDirectory := self baseUrl copyFrom: 1 to: (self baseUrl lastIndexOf: $/)].
	^resourceDirectory