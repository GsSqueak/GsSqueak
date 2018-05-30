accessing
extractToFileNamed: aLocalFileName inDirectory: dir
	| stream fullName fullDir |
	self isEncrypted ifTrue: [ ^self error: 'encryption unsupported' ].
	fullName := dir fullNameFor: aLocalFileName.
	fullDir := FileDirectory forFileName: fullName.
	fullDir assureExistence.
	self isDirectory ifFalse: [
		stream := fullDir forceNewFileNamed: (FileDirectory localNameFor: fullName).
		self extractTo: stream.
		stream close.
	] ifTrue: [ fullDir assureExistence ]
