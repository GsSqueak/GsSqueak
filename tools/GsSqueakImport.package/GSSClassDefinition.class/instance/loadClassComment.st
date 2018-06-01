loading
loadClassComment

	| entry |
	entry := self fileDirectory entryAt: 'README.md' ifAbsent: [^ self].
	entry isDirectory ifTrue: [^ self].
	comment := entry readStream contentsOfEntireFile withSqueakLineEndings