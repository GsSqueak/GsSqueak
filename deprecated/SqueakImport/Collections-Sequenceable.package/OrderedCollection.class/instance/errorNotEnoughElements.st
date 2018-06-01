private
errorNotEnoughElements

	self error: (String streamContents: [ :stream | 
		stream nextPutAll: 'attempt to remove more elements than possible from '.
		self printNameOn: stream ])