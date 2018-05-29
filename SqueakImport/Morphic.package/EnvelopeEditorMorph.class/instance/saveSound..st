menu
saveSound: evt
	| newName |
	newName := UIManager default request: 'Please confirm name for save...'
						initialAnswer: soundName.
	newName isEmpty ifTrue: [^ self].
	AbstractSound soundNamed: newName put: sound.
	soundName := newName.