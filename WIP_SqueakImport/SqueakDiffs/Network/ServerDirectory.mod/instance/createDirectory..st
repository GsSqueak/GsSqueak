file directory
createDirectory: localName
	"Create a new sub directory within the current one"

	self isTypeFile ifTrue: [
		^FileDirectory createDirectory: localName
	].

	client := self openFTPClient.
	self switchDirectory.
	[client makeDirectory: localName]
		ensure: [self quit].
