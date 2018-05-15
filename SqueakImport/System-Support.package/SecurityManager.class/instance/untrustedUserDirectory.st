accessing
untrustedUserDirectory
	"SecurityManager default untrustedUserDirectory"
	| dir |
	dir := self primUntrustedUserDirectory.
	^ dir
		ifNil: [FileDirectory default pathName]
		ifNotNil: [dir vmPathToSqueakPath]