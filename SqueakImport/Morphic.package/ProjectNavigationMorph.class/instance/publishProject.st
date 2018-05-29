the actions
publishProject

	self world paintBoxOrNil ifNotNil: [
		(self confirm: 'You seem to be painting a sketch.
Do you continue and publish the project with the paint tool?' translated) ifFalse: [^ self].
	].
	self 
		publishStyle: #limitedSuperSwikiPublishDirectoryList 
		forgetURL: false
		withRename: false