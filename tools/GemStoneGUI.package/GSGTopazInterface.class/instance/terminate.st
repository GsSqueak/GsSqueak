initialize-release
terminate

	self topazProcess terminate.
	self changed: #sessionClosed.
	self class removeInstance: self