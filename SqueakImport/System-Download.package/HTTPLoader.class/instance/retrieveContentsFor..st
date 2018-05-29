requests
retrieveContentsFor: url
	| request |
	request := self class httpRequestClass for: url in: self.
	self addRequest: request.
	^request contents