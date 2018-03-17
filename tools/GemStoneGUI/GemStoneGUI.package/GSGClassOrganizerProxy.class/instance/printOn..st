printing
printOn: aStream

	aStream nextPutAll: (self interface messageCategoryStringFor: self env: self envId)