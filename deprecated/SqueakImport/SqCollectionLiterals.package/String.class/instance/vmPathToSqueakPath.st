converting
vmPathToSqueakPath
	"convert a file path string received from the vm to a Squeak String"

	^ (FilePath pathName: self isEncoded: true) asSqueakPathName
