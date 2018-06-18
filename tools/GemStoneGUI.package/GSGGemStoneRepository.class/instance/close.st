interface
close

	self class removeInstance: self.
	self changed: #sessionClosed.