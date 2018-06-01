private
openPath: anArray
	| first |
	first := roots detect: [:ea | ea matches: anArray first] ifNone: [^ self].
	first openPath: anArray allButFirst