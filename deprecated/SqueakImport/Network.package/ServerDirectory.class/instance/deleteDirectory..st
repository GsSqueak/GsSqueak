file directory
deleteDirectory: localName
	"Delete the sub directory within the current one.  Call needs to ask user to confirm."

	self isTypeFile ifTrue: [
		^FileDirectory deleteFileNamed: localName
	].
		"Is this the right command???"

	client := self openFTPClient.
	[ self switchDirectory.
	client deleteDirectory: localName]
		ensure: [self quit].
