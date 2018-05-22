file in/out
storeManifestFileIn: aFileDirectory

	| file |
	file := aFileDirectory forceNewFileNamed: (self name, FileDirectory dot,'manifest').
	file ifNil: [^ self].
	file converter: UTF8TextConverter new.
	self storeAttributesOn: file.
	file close.
