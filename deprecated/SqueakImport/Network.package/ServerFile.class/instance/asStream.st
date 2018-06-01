as yet unclassified
asStream
	"Return a RemoteFileStream (subclass of RWBinaryOrTextStream) on the contents of the remote file I represent.  For reading only.  This method is probably misnamed.  Maybe call it makeStream"

	^ self readOnlyFileNamed: self fileName