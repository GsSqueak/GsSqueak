menu
editSoundNamed: name

	name = 'new...' ifTrue: [^ self editNewSound].
	soundName := name.
	self editSound: (AbstractSound soundNamed: soundName) copy