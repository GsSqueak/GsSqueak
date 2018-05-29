initialize-release
body: newBody
	
	self isMultipart 
		ifTrue: [self body parts at: 1 put: newBody]
		ifFalse: [body := newBody]