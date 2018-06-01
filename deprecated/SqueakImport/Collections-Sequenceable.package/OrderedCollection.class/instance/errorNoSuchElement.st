private
errorNoSuchElement

	self error: (String streamContents: [ :stream | 
		stream nextPutAll: 'attempt to index a non-existent element in '.
		self printNameOn: stream ])