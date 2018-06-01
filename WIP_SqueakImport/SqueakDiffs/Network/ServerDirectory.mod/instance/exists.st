file directory
exists
	"It is difficult to tell if a directory exists.  This is ugly, but it works for writable directories.  http: will fall back on ftp for this"

	| probe |
	self isTypeFile ifTrue: [
		self entries size > 0 ifTrue: [^ true].
		probe := self newFileNamed: 'withNoName23'. 
		probe ifNotNil: [
			probe close.
			probe directory deleteFileNamed: probe localName].
		^probe notNil].
	^
	[client := self openFTPClient.
	[self switchDirectory]
		ensure: [self quit].
	true]
		on: Error
		do: [:ex | false]