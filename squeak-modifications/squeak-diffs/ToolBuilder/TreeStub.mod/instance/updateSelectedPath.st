events
updateSelectedPath
	| path first |
	path := self model perform: spec getSelectedPath.
	first := roots detect: [:ea | ea item = path first] ifNone: [^ self].
	first selectPath: path allButFirst.